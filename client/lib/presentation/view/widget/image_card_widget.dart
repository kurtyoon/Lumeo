import 'package:Lumeo/app/config/color_system.dart';
import 'package:Lumeo/presentation/view/widget/image_title_widget.dart';
import 'package:flutter/material.dart';

class ImageCardWidget extends StatelessWidget {
  final String imageUrl;
  final String filename;

  const ImageCardWidget({
    super.key,
    required this.imageUrl,
    required this.filename,
  });

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
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child:
                        Icon(Icons.error, size: 50, color: ColorSystem.error),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageTitleWidget(filename: filename),
          ),
        ],
      ),
    );
  }
}
