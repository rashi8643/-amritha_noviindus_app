import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/theme/light_theme.dart';
import 'package:novi_indus_test/core/widgets/splash_screen.dart';
import 'package:novi_indus_test/features/login/presentation/provider/auth_redirect_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ref.watch(lightThemeProvider),
      home: switch (ref.watch(authRedirectProvider)) {
        AsyncData(:final value) => value,
        AsyncError(:final error) => Scaffold(
            body: Center(
              child: Text("$error"),
            ),
          ),
        _ => const SplashSrceen(),
      },
    );
  }
}
