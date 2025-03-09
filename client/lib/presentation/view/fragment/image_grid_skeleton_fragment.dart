import 'package:Lumeo/presentation/view/widget/image_skeleton_widget.dart';
import 'package:flutter/material.dart';

class ImageGridSkeletonFragment extends StatelessWidget {
  const ImageGridSkeletonFragment({super.key});

  @override
  Widget build(BuildContext context) {
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
          itemCount: 12,
          itemBuilder: (context, index) {
            return const ImageSkeletonWidget();
          },
        );
      },
    );
  }
}
