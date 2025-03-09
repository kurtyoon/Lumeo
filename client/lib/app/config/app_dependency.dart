import 'package:Lumeo/data/provider/image_remote_provider.dart';
import 'package:Lumeo/data/provider/image_remote_provider_impl.dart';
import 'package:Lumeo/data/repository/image_repository_impl.dart';
import 'package:Lumeo/domain/repository/image_repository.dart';
import 'package:get/get.dart';

class AppDependency extends Bindings {
  @override
  void dependencies() {
    // Add your provider dependencies here
    Get.lazyPut<ImageRemoteProvider>(() => ImageRemoteProviderImpl());

    // Add your repository dependencies here
    Get.lazyPut<ImageRepository>(() => ImageRepositoryImpl());
  }
}
