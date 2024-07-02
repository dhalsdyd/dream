import 'package:dream/app/core/theme/color_theme.dart';
import 'package:dream/app/core/theme/text_theme.dart';
import 'package:dream/app/widgets/button.dart';
import 'package:flutter/material.dart';

class DreamDialogAction {
  final String title;
  final void Function()? onTap;
  final bool isHighlighted;
  DreamDialogAction({required this.title, this.onTap, this.isHighlighted = false});
}

class DreamDialogActionButton extends StatelessWidget {
  const DreamDialogActionButton(this.action, {Key? key}) : super(key: key);
  final DreamDialogAction action;

  @override
  Widget build(BuildContext context) {
    return DreamMediumTextButton(
      text: action.title,
      onTap: action.onTap,
      color: action.isHighlighted ? DreamColors.mainColor : DreamColors.black,
    );
  }
}

class DreamDialog extends StatelessWidget {
  const DreamDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  final String title;
  final String content;

  final List<DreamDialogAction> actions;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: DreamTextTheme.bold20),
            const SizedBox(height: 12),
            Text(content, style: DreamTextTheme.regular12),
            const SizedBox(height: 12),
            for (var action in actions)
              Column(
                children: [
                  const SizedBox(height: 12),
                  DreamDialogActionButton(action),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
