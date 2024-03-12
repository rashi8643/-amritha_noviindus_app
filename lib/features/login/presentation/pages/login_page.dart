import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/login_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/core/widgets/button_widget.dart';
import 'package:novi_indus_test/features/login/presentation/provider/login_provider.dart';
import 'package:novi_indus_test/features/login/presentation/widgets/login_image_widget.dart';
import 'package:novi_indus_test/core/widgets/sub_title_widgets.dart';
import 'package:novi_indus_test/features/login/presentation/widgets/login_title_widget.dart';
import 'package:novi_indus_test/core/widgets/text_field_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = ref.read(loginProvider.notifier).userNameController;
    final passController = ref.read(loginProvider.notifier).passwordController;
    final theme = AppTheme.of(context);
    final appConstants = ref.watch(loginConstantsProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LoginImageWidget(),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            const LoginTitleWidget(),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            SubTitleWidget(
              title: appConstants.txtuserName,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              controller: userController,
              labelText: appConstants.txtEnterUserName,
            ),
            SizedBox(
              height: theme.spaces.space_300,
            ),
            SubTitleWidget(
              title: appConstants.txtPassword,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              controller: passController,
              labelText: appConstants.txtEnterPass,
            ),
            SizedBox(
              height: theme.spaces.space_500 * 1.5,
            ),
            ButtonWidget(
              buttonName: appConstants.txtLogin,
              onPressed: ref.watch(loginProvider).isLoading
                  ? null
                  : () {
                      if (userController.text.isNotEmpty &&
                          passController.text.isNotEmpty) {
                        ref.read(loginProvider.notifier).login(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Username and Password can't be empty"),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
