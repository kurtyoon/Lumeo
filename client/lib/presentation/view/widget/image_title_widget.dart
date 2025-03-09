import 'package:Lumeo/app/config/font_system.dart';
import 'package:flutter/material.dart';

class ImageTitleWidget extends StatelessWidget {
  final String filename;

  const ImageTitleWidget({super.key, required this.filename});

  @override
  Widget build(BuildContext context) {
    return Text(
      filename,
      textAlign: TextAlign.center,
      style: FontSystem.Sub1,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
