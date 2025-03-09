import 'dart:io';
import 'package:Lumeo/core/provider/base_connect.dart';
import 'package:Lumeo/core/wrapper/response_wrapper.dart';
import 'package:get/get.dart';
import 'image_remote_provider.dart';

class ImageRemoteProviderImpl extends BaseConnect
    implements ImageRemoteProvider {
  @override
  Future<ResponseWrapper> getImageList({required String? token}) async {
    final Map<String, String> queryParams = {};

    if (token != null) {
      queryParams['token'] = token;
    }

    Response response = await get(
      '/images',
    );

    return ResponseWrapper.fromJson(response.body);
  }

  @override
  Future<ResponseWrapper> getImage({required String filename}) async {
    Response response = await get(
      '/images/$filename',
      headers: BaseConnect.basicHeaders,
    );

    return ResponseWrapper.fromJson(response.body);
  }

  @override
  Future<ResponseWrapper> createImage({required File imageFile}) async {
    final formData = FormData({
      'image':
          MultipartFile(imageFile, filename: imageFile.path.split('/').last),
    });

    Response response = await post(
      '/images',
      formData,
      headers: {
        'Content-Type': 'multipart/form-data',
      },
    );

    return ResponseWrapper.fromJson(response.body);
  }

  @override
  Future<ResponseWrapper> deleteImage({required String filename}) async {
    Response response = await delete(
      '/images/$filename',
      headers: BaseConnect.basicHeaders,
    );

    if (response.statusCode == 204) {
      return ResponseWrapper.noContent();
    }

    return ResponseWrapper.fromJson(response.body);
  }
}
