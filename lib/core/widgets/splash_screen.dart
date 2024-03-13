import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/app_assets_constants.dart';

class SplashSrceen extends ConsumerWidget {
  const SplashSrceen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ref.watch(appAssetsConstantsProvider).icSplash,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
