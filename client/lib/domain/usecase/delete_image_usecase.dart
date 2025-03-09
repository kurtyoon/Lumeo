import 'package:Lumeo/core/usecase/async/async_condition_usecase.dart';
import 'package:Lumeo/core/usecase/base/base_usecase.dart';
import 'package:Lumeo/core/wrapper/state_wrapper.dart';
import 'package:Lumeo/domain/condition/delete_image_condition.dart';
import 'package:Lumeo/domain/repository/image_repository.dart';
import 'package:get/get.dart';

class DeleteImageUseCase extends BaseUsecase
    implements AsyncConditionUseCase<void, DeleteImageCondition> {
  late final ImageRepository _imageRepository;

  @override
  void onInit() {
    super.onInit();

    _imageRepository = Get.find<ImageRepository>();
  }

  @override
  Future<StateWrapper<void>> execute(
    DeleteImageCondition condition,
  ) async {
    StateWrapper<void> state = await _imageRepository.deleteImage(condition);

    return state;
  }
}
