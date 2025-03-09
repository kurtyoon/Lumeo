import 'package:Lumeo/core/wrapper/response_wrapper.dart';
import 'package:Lumeo/core/wrapper/state_wrapper.dart';
import 'package:Lumeo/data/provider/image_remote_provider.dart';
import 'package:Lumeo/domain/condition/create_image_condition.dart';
import 'package:Lumeo/domain/condition/delete_image_condition.dart';
import 'package:Lumeo/domain/condition/read_image_condition.dart';
import 'package:Lumeo/domain/condition/read_image_list_condition.dart';
import 'package:Lumeo/domain/entity/image_brief_state.dart';
import 'package:Lumeo/domain/entity/image_detail_state.dart';
import 'package:Lumeo/domain/entity/image_list_state.dart';
import 'package:Lumeo/domain/repository/image_repository.dart';
import 'package:get/get.dart';

class ImageRepositoryImpl extends GetxService implements ImageRepository {
  late final ImageRemoteProvider _imageProvider;

  @override
  void onInit() {
    super.onInit();

    _imageProvider = Get.find<ImageRemoteProvider>();
  }

  @override
  Future<StateWrapper<ImageListState<ImageDetailState>>> getImageList(
      ReadImageListCondition condition) async {
    ResponseWrapper response =
        await _imageProvider.getImageList(token: condition.token);

    ImageListState<ImageDetailState>? state;

    if (response.success) {
      state = ImageListState.fromJson(
        response.data!,
        ImageDetailState.fromJson,
      );
    }

    return StateWrapper(
      success: response.success,
      message: response.message,
      data: state,
    );
  }

  @override
  Future<StateWrapper<ImageBriefState>> getImage(
      ReadImageCondition condition) async {
    ResponseWrapper response = await _imageProvider.getImage(
      filename: condition.filename,
    );

    ImageBriefState? state;

    if (response.success) {
      state = ImageBriefState.fromJson(response.data!);
    }

    return StateWrapper(
      success: response.success,
      message: response.message,
      data: state,
    );
  }

  @override
  Future<StateWrapper<ImageDetailState>> createImage(
      CreateImageCondition condition) async {
    ResponseWrapper response = await _imageProvider.createImage(
      imageFile: condition.imageFile,
    );

    ImageDetailState? state;

    if (response.success) {
      state = ImageDetailState.fromJson(response.data!);
    }

    return StateWrapper(
      success: response.success,
      message: response.message,
      data: state,
    );
  }

  @override
  Future<StateWrapper<void>> deleteImage(DeleteImageCondition condition) async {
    ResponseWrapper response = await _imageProvider.deleteImage(
      filename: condition.filename,
    );

    return StateWrapper<void>(
      success: response.success,
      message: response.message,
    );
  }
}
