import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:smart_duel_disk/packages/ui_components/lib/ui_components.dart';
import 'package:smart_duel_disk/packages/core/core_general/lib/core_general.dart';

class DuelFormTextField extends HookWidget {
  final String label;
  final String hint;
  final Stream<String> textStream;
  final TextChangedCallback onChanged;
  final TextChangedCallback onSubmitted;

  const DuelFormTextField({
    @required this.label,
    @required this.hint,
    @required this.textStream,
    @required this.onChanged,
    @required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final snapshot = useStream(textStream);
    if (snapshot.data != null && controller.text.isNullOrEmpty) {
      controller.text = snapshot.data;
    }

    final hasFocus = useState(false);
    final focusNode = useFocusNode();
    focusNode.addListener(() => hasFocus.value = focusNode.hasFocus);

    final labelColor = hasFocus.value ? AppColors.primaryAccentColor : Colors.grey;

    return TextField(
      controller: controller,
      focusNode: focusNode,
      cursorColor: AppColors.primaryAccentColor,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(16),
        labelText: label,
        labelStyle: TextStyle(color: labelColor),
        hintText: hint,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryAccentColor),
        ),
      ),
    );
  }
}
