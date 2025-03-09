import 'package:Lumeo/core/screen/base_widget.dart';
import 'package:Lumeo/presentation/view/widget/image_card_widget.dart';
import 'package:Lumeo/presentation/view_model/image_view_model.dart';
import 'package:flutter/material.dart';

class ImageGridFragment extends BaseWidget<ImageViewModel> {
  const ImageGridFragment({super.key});

  @override
  Widget buildView(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = (constraints.maxWidth / 150).floor().clamp(2, 6);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.9,
          ),
          itemCount: viewModel.imageList.images.length,
          itemBuilder: (context, index) {
            return ImageCardWidget(
              imageUrl: viewModel.imageList.images[index].imageUrl,
              filename: viewModel.imageList.images[index].filename,
            );
          },
        );
      },
    );
  }
}
