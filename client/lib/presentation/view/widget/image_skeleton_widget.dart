import 'package:Lumeo/app/config/color_system.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageSkeletonWidget extends StatelessWidget {
  const ImageSkeletonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Shimmer.fromColors(
                baseColor: ColorSystem.neutral.shade100,
                highlightColor: ColorSystem.neutral.shade300,
                child: Container(
                  width: double.infinity,
                  color: ColorSystem.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              baseColor: ColorSystem.neutral.shade300,
              highlightColor: ColorSystem.neutral.shade100,
              child: Container(
                height: 16,
                width: double.infinity,
                color: ColorSystem.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
