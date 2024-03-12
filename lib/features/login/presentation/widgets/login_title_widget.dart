import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/login_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class LoginTitleWidget extends ConsumerWidget {
  const LoginTitleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final appConstants = ref.watch(loginConstantsProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
      child: SizedBox(
        height: theme.spaces.space_400 * 2.6,
        child: Text(
          appConstants.txtHead,
          style: theme.typography.h600.copyWith(
            fontSize: theme.spaces.space_300 * 1.2,
          ),
        ),
      ),
    );
  }
}
