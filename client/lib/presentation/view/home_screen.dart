import 'package:Lumeo/app/config/color_system.dart';
import 'package:Lumeo/core/screen/base_screen.dart';
import 'package:Lumeo/presentation/view/fragment/image_list_fragment.dart';
import 'package:Lumeo/presentation/view_model/image_view_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends BaseScreen<ImageViewModel> {
  const HomeScreen({super.key});

  @override
  Color? get screenBackgroundColor => ColorSystem.white;

  @override
  Widget buildBody(BuildContext context) {
    return const ImageListFragment();
  }
}
