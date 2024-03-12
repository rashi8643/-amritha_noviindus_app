import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class ButtonWidget extends ConsumerWidget {
  final void Function()? onPressed;
  final String buttonName;
  const ButtonWidget({
    super.key,
    required this.buttonName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: theme.spaces.space_500 * 1.4,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                theme.spaces.space_100,
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            buttonName,
            style: theme.typography.h500.copyWith(
              color: theme.colors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
