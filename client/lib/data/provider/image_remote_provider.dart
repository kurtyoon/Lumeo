import 'dart:io';

import 'package:Lumeo/core/wrapper/response_wrapper.dart';

abstract class ImageRemoteProvider {
  Future<ResponseWrapper> getImageList({
    required String? token,
  });

  Future<ResponseWrapper> getImage({
    required String filename,
  });

  Future<ResponseWrapper> createImage({
    required File imageFile,
  });

  Future<ResponseWrapper> deleteImage({
    required String filename,
  });
}
