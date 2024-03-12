import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/app_assets_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class LoginImageWidget extends ConsumerWidget {
  const LoginImageWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final appAssets = ref.watch(appAssetsConstantsProvider);
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: theme.spaces.space_500 * 6,
          child: Image.asset(
            appAssets.icLogin,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 80,
          left: 160,
          child: SizedBox(
            width: theme.spaces.space_500 * 2.5,
            height: theme.spaces.space_500 * 2.5,
            child: Image.asset(
              appAssets.icLogo,
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    );
  }
}
