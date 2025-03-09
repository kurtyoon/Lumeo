import 'package:Lumeo/core/wrapper/state_wrapper.dart';
import 'package:Lumeo/domain/condition/create_image_condition.dart';
import 'package:Lumeo/domain/condition/delete_image_condition.dart';
import 'package:Lumeo/domain/condition/read_image_condition.dart';
import 'package:Lumeo/domain/condition/read_image_list_condition.dart';
import 'package:Lumeo/domain/entity/image_brief_state.dart';
import 'package:Lumeo/domain/entity/image_detail_state.dart';
import 'package:Lumeo/domain/entity/image_list_state.dart';

abstract class ImageRepository {
  Future<StateWrapper<ImageListState<ImageDetailState>>> getImageList(
      ReadImageListCondition condition);

  Future<StateWrapper<ImageDetailState>> createImage(
      CreateImageCondition condition);

  Future<StateWrapper<ImageBriefState>> getImage(ReadImageCondition condition);

  Future<StateWrapper<void>> deleteImage(DeleteImageCondition condition);
}
