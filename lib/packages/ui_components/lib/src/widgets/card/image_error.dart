import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class ImageError extends StatelessWidget {
  const ImageError();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.error,
        color: AppColors.primaryIconColor,
      ),
    );
  }
}
