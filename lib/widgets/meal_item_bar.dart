import 'package:flutter/material.dart';

class MealItemBar extends StatelessWidget {
  const MealItemBar(this.icon, this.text, this.isString, {super.key});
  final IconData icon;
  final String text;
  final bool isString;

  String convertFirstLetterToUpperCase() {
    return text[0].toUpperCase() + text.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 17,
        ),
        const SizedBox(
          width: 3,
        ),
        Text(isString ? convertFirstLetterToUpperCase() : text,
            style: theme.textTheme.bodySmall),
      ],
    );
  }
}
