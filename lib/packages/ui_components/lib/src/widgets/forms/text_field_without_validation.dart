import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';

typedef TextChangedCallback = void Function(String value);

class TextFieldWithoutValidation extends HookWidget {
  final String hintText;
  final TextChangedCallback onChanged;
  final VoidCallback onClearPressed;

  const TextFieldWithoutValidation({
    required this.hintText,
    required this.onChanged,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(
        color: AppColors.primaryIconColor,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: _ClearButton(
          controller: controller,
          onClearPressed: onClearPressed,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryAccentColor,
          ),
        ),
      ),
    );
  }
}

class _ClearButton extends HookWidget {
  final TextEditingController? controller;
  final VoidCallback onClearPressed;

  const _ClearButton({
    required this.controller,
    required this.onClearPressed,
  });

  @override
  Widget build(BuildContext context) {
    final controllerValue = useValueListenable(controller!);

    if (controllerValue.text.isNullOrEmpty) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: const Icon(
        Icons.clear,
        color: AppColors.primaryIconColor,
      ),
      onPressed: () {
        controller!.clear();
        onClearPressed();
      },
    );
  }
}
