import 'package:Lumeo/domain/usecase/create_image_usecase.dart';
import 'package:Lumeo/domain/usecase/delete_image_usecase.dart';
import 'package:Lumeo/domain/usecase/read_image_list_usecase.dart';
import 'package:Lumeo/domain/usecase/read_image_usecase.dart';
import 'package:Lumeo/presentation/view_model/image_view_model.dart';
import 'package:get/get.dart';

class ImageBinding extends Bindings {
  @override
  void dependencies() {
    // Add your usecase dependencies here
    Get.lazyPut<ReadImageListUseCase>(
      () => ReadImageListUseCase(),
    );

    Get.lazyPut<ReadImageUseCase>(
      () => ReadImageUseCase(),
    );

    Get.lazyPut<CreateImageUseCase>(
      () => CreateImageUseCase(),
    );

    Get.lazyPut<DeleteImageUseCase>(
      () => DeleteImageUseCase(),
    );

    // Add your view model dependencies here
    Get.lazyPut<ImageViewModel>(
      () => ImageViewModel(),
    );
  }
}
