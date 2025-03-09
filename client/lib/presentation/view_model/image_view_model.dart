import 'package:Lumeo/core/wrapper/state_wrapper.dart';
import 'package:Lumeo/domain/condition/read_image_list_condition.dart';
import 'package:Lumeo/domain/entity/image_list_state.dart';
import 'package:Lumeo/domain/usecase/create_image_usecase.dart';
import 'package:Lumeo/domain/usecase/delete_image_usecase.dart';
import 'package:Lumeo/domain/usecase/read_image_list_usecase.dart';
import 'package:Lumeo/domain/usecase/read_image_usecase.dart';
import 'package:get/get.dart';

class ImageViewModel extends GetxController {
  late final ReadImageListUseCase _readImageListUseCase;
  late final ReadImageUseCase _readImageUseCase;
  late final CreateImageUseCase _createImageUseCase;
  late final DeleteImageUseCase _deleteImageUseCase;

  /* ------------------------------------------------------ */
  /* Private Fields --------------------------------------- */
  /* ------------------------------------------------------ */

  late final RxBool _isLoading;
  late final Rx<ImageListState> _imageList;
  late final RxString _nextToken;

  /* ------------------------------------------------------ */
  /* Public Fields ---------------------------------------- */
  /* ------------------------------------------------------ */

  bool get isLoading => _isLoading.value;

  ImageListState get imageList => _imageList.value;

  @override
  void onInit() {
    super.onInit();

    _createImageUseCase = Get.find<CreateImageUseCase>();
    _readImageListUseCase = Get.find<ReadImageListUseCase>();
    _readImageUseCase = Get.find<ReadImageUseCase>();
    _deleteImageUseCase = Get.find<DeleteImageUseCase>();

    _imageList = Rx<ImageListState>(ImageListState.initial());
    _isLoading = true.obs;
    _nextToken = ''.obs;
  }

  @override
  void onReady() async {
    _isLoading.value = true;

    await Future.wait([
      _fetchImageList(),
    ]);

    _isLoading.value = false;
  }

  Future<void> _fetchImageList() async {
    StateWrapper<ImageListState> state = await _readImageListUseCase.execute(
      ReadImageListCondition(),
    );

    if (state.success) {
      _imageList.value = state.data!;
    }
  }
}
