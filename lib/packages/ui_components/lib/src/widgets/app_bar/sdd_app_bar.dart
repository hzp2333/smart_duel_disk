import 'package:flutter/material.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

class SddAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showCloseButton;

  const SddAppBar({
    @required this.title,
    this.showBackButton = true,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      backgroundColor: AppColors.primaryBackgroundColor,
      leading: showBackButton ? const BackButton(color: AppColors.primaryIconColor) : null,
      title: Text(title),
      actions: [
        if (showCloseButton) ...{
          const CloseButton(),
        },
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
