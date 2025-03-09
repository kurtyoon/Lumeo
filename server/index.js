const express = require("express");
const awsServerlessExpress = require("aws-serverless-express");
const {
  S3Client,
  PutObjectCommand,
  ListObjectsV2Command,
  GetObjectCommand,
  DeleteObjectCommand,
} = require("@aws-sdk/client-s3");
const { getSignedUrl } = require("@aws-sdk/s3-request-presigner");
const { v4: uuidv4 } = require("uuid");
const multer = require("multer");
const dotenv = require("dotenv");
const cors = require("cors");

dotenv.config();

const app = express();

app.use(
  cors({
    origin: "*",
    methods: ["GET", "POST", "DELETE"],
    allowedHeaders: ["Content-Type"],
  })
);

const upload = multer({
  limits: {
    fileSize: 10 * 1024 * 1024,
  },
});
app.use(express.json());

const s3 = new S3Client({ region: process.env.AWS_REGION });
const BUCKET_NAME = process.env.BUCKET_NAME;
const ITEMS_PER_PAGE = 12;

function generateFilename(originalFilename) {
  const uuid = uuidv4();
  const date = new Date().toISOString().split("T")[0].replace(/-/g, "");
  const extension = originalFilename.split(".").pop();
  return `${uuid}_${date}.${extension}`;
}

function successResponse(data) {
  return {
    success: true,
    data: data,
    error: null,
  };
}

function errorResponse(errorMessage) {
  return {
    success: false,
    data: null,
    error: errorMessage,
  };
}

app.get("/", async (req, res) => {
  res.status(200).json(
    successResponse({
      message: "Lamgda Express API is Running",
    })
  );
});

app.post("/images", upload.single("image"), async (req, res) => {
  try {
    if (!req.file)
      return res.status(400).json(errorResponse("No file uploaded"));

    const newFilename = generateFilename(req.file.originalname);

    const uploadCommand = new PutObjectCommand({
      Bucket: BUCKET_NAME,
      Key: newFilename,
      Body: req.file.buffer,
      ContentType: req.file.contentType,
      ContentDisposition: "inline",
    });

    await s3.send(uploadCommand);

    const getCommand = new GetObjectCommand({
      Bucket: BUCKET_NAME,
      Key: newFilename,
    });

    const presignedUrl = await getSignedUrl(s3, getCommand, {
      expiresIn: 3600,
    });

    res.status(201).json(
      successResponse({
        filename: newFilename,
        image_url: presignedUrl,
        created_at: new Date().toISOString().split("T")[0],
      })
    );
  } catch (error) {
    res.status(500).json(errorResponse(error.message));
  }
});

app.get("/images", async (req, res) => {
  try {
    const continuationToken = req.query.token || null;
    const command = new ListObjectsV2Command({
      Bucket: BUCKET_NAME,
      MaxKeys: ITEMS_PER_PAGE,
      ContinuationToken: continuationToken,
    });

    const response = await s3.send(command);

    let images = response.Contents
      ? await Promise.all(
          response.Contents.map(async (obj) => {
            const getCommand = new GetObjectCommand({
              Bucket: BUCKET_NAME,
              Key: obj.Key,
            });

            const imageUrl = await getSignedUrl(s3, getCommand, {
              expiresIn: 3600,
            });

            return {
              filename: obj.Key,
              image_url: imageUrl,
              created_at: obj.LastModified.toISOString().split("T")[0],
            };
          })
        )
      : [];

    images.sort((a, b) => new Date(b.created_at) - new Date(a.created_at));

    const nextToken = response.NextContinuationToken || null;

    res.status(200).json(successResponse({ images, nextToken }));
  } catch (error) {
    res.status(500).json(errorResponse(error.message));
  }
});

app.get("/images/:filename", async (req, res) => {
  try {
    const { filename } = req.params;

    // S3 객체의 공개 URL 생성
    const imageUrl = `https://${BUCKET_NAME}.s3.ap-northeast-2.amazonaws.com/${filename}`;

    res.status(200).json(successResponse({ image_url: imageUrl }));
  } catch (error) {
    res.status(500).json(errorResponse(error.message));
  }
});

app.delete("/images/:filename", async (req, res) => {
  try {
    const { filename } = req.params;

    const command = new DeleteObjectCommand({
      Bucket: BUCKET_NAME,
      Key: filename,
    });

    s3.send(command);

    res.status(204);
  } catch (error) {
    res.status(500).json(errorResponse(error.message));
  }
});

const server = awsServerlessExpress.createServer(app);

exports.handler = (event, context) => {
  event.path = event.rawPath || "/";
  event.httpMethod = event.requestContext.http.method;
  return awsServerlessExpress.proxy(server, event, context);
};
