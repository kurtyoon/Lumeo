import 'package:Lumeo/core/usecase/async/async_condition_usecase.dart';
import 'package:Lumeo/core/usecase/base/base_usecase.dart';
import 'package:Lumeo/core/wrapper/state_wrapper.dart';
import 'package:Lumeo/domain/condition/read_image_condition.dart';
import 'package:Lumeo/domain/entity/image_brief_state.dart';
import 'package:Lumeo/domain/repository/image_repository.dart';
import 'package:get/get.dart';

class ReadImageUseCase extends BaseUsecase
    implements AsyncConditionUseCase<ImageBriefState, ReadImageCondition> {
  late final ImageRepository _imageRepository;

  @override
  void onInit() {
    super.onInit();

    _imageRepository = Get.find<ImageRepository>();
  }

  @override
  Future<StateWrapper<ImageBriefState>> execute(
    ReadImageCondition condition,
  ) async {
    await Future.delayed(const Duration(milliseconds: 200));

    StateWrapper<ImageBriefState> state = await _imageRepository.getImage(
      condition,
    );

    return state;
  }
}
