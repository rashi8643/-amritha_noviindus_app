import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/presentation/pages/home_page.dart';
import '../pages/login_page.dart';
part 'auth_redirect_provider.g.dart';

@riverpod
Future<Widget> authRedirect(AuthRedirectRef ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = prefs.getString("token");
  await Future.delayed(const Duration(seconds: 2));
  if (token == null) {
    return const LoginPage();
  } else {
    return const HomePage();
  }
}
