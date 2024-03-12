import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class ContainerWidget extends ConsumerWidget {
  final String text;
  final void Function()? onTap;
  const ContainerWidget({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spaces.space_300,
        vertical: theme.spaces.space_100,
      ),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: theme.spaces.space_500 * 1.5,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.colors.primary,
            ),
            borderRadius: BorderRadius.circular(
              theme.spaces.space_100,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: theme.typography.h500.copyWith(
                  fontSize: theme.spaces.space_250,
                  color: theme.colors.textSubtlest,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
