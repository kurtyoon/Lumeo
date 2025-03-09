import 'package:Lumeo/app/config/font_system.dart';
import 'package:Lumeo/core/screen/base_widget.dart';
import 'package:Lumeo/presentation/view/fragment/image_grid_fragment.dart';
import 'package:Lumeo/presentation/view/fragment/image_grid_skeleton_fragment.dart';
import 'package:Lumeo/presentation/view_model/image_view_model.dart';
import 'package:flutter/material.dart';

class ImageListFragment extends BaseWidget<ImageViewModel> {
  const ImageListFragment({super.key});

  @override
  Widget buildView(BuildContext context) {
    if (viewModel.isLoading) {
      return const ImageGridSkeletonFragment();
    }

    if (viewModel.imageList.images.isEmpty) {
      return const Center(
        child: Text(
          "이미지가 없어용",
          style: FontSystem.H5,
        ),
      );
    }

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: ImageGridFragment(),
    );
  }
}
