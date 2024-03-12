import 'package:flutter/material.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final Icon iconData;
  final TextEditingController controller;
  const TextFieldWidget(
      {super.key,
      required this.labelText,
      required this.iconData,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context).colors;
    final space = AppTheme.of(context).spaces;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: space.space_300,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: colors.textInverse,
          filled: true,
          labelText: labelText,
          labelStyle: TextStyle(color: colors.textSubtle),
          prefixIcon: iconData,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colors.textInverse,
              width: 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
