import 'dart:async';

import 'package:flutter/material.dart';
import 'package:novi_indus_test/features/home/presentation/pages/home_page.dart';
import 'package:novi_indus_test/features/login/data/repository/login_repository_impl.dart';
import 'package:novi_indus_test/features/login/domain/usecase/login_usecase.dart';
import 'package:novi_indus_test/features/login/presentation/provider/login_provider_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_provider.g.dart';

@riverpod
class Login extends _$Login {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  LoginProviderState build() {
    return LoginProviderState(
      isLoading: false,
      token: '',
    );
  }

  Future<void> login(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    try {
      final user =
          await LoginUsecase(repository: ref.watch(loginRepositoryProvider))(
              userNameController.text, passwordController.text);
      if (user.token != null) {
        state = state.copyWith(token: user.token!);
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', user.token!);
        Future.sync(
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false),
        );
      }
    } catch (e) {
      Future.sync(
        () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Colors.redAccent,
          ),
        ),
      );
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
