import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/login_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/core/widgets/button_widget.dart';
import 'package:novi_indus_test/features/home/presentation/pages/home_page.dart';
import 'package:novi_indus_test/features/login/presentation/widgets/login_image_widget.dart';
import 'package:novi_indus_test/features/login/presentation/widgets/login_sub_title_widgets.dart';
import 'package:novi_indus_test/features/login/presentation/widgets/login_title_widget.dart';
import 'package:novi_indus_test/core/widgets/text_field_widget.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userController = TextEditingController();
    final passController = TextEditingController();
    final theme = AppTheme.of(context);
    final appConstants = ref.watch(loginConstantsProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginImageWidget(),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            LoginTitleWidget(),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            LoginSubTitleWidget(
              title: appConstants.txtuserName,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              controller: userController,
              iconData: Icon(
                Icons.person,
              ),
              labelText: appConstants.txtEnterUserName,
            ),
            SizedBox(
              height: theme.spaces.space_300,
            ),
            LoginSubTitleWidget(
              title: appConstants.txtPassword,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              controller: passController,
              iconData: Icon(
                Icons.lock,
              ),
              labelText: appConstants.txtEnterPass,
            ),
            SizedBox(
              height: theme.spaces.space_500 * 1.5,
            ),
            ButtonWidget(
              buttonName: appConstants.txtLogin,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
