import 'package:Lumeo/app/utility/log_util.dart';
import 'package:Lumeo/core/usecase/async/async_condition_usecase.dart';
import 'package:Lumeo/core/usecase/base/base_usecase.dart';
import 'package:Lumeo/core/wrapper/state_wrapper.dart';
import 'package:Lumeo/domain/condition/create_image_condition.dart';
import 'package:Lumeo/domain/entity/image_detail_state.dart';
import 'package:Lumeo/domain/repository/image_repository.dart';
import 'package:get/get.dart';

class CreateImageUseCase extends BaseUsecase
    implements AsyncConditionUseCase<ImageDetailState, CreateImageCondition> {
  late final ImageRepository _imageRepository;

  @override
  void onInit() {
    super.onInit();

    _imageRepository = Get.find<ImageRepository>();
  }

  @override
  Future<StateWrapper<ImageDetailState>> execute(
      CreateImageCondition condition) async {
    await Future.delayed(const Duration(milliseconds: 200));

    StateWrapper<ImageDetailState> state =
        await _imageRepository.createImage(condition);

    return state;
  }
}
