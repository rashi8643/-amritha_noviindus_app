import 'package:flutter/material.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class LoginSubTitleWidget extends StatelessWidget {
  final String title;
  const LoginSubTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spaces.space_300,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: theme.typography.h400.copyWith(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
