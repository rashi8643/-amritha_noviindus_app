import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/core/widgets/button_widget.dart';
import 'package:novi_indus_test/core/widgets/sub_title_widgets.dart';
import 'package:novi_indus_test/core/widgets/text_field_widget.dart';

class RegisterationPage extends ConsumerWidget {
  const RegisterationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final theme = AppTheme.of(context);
    final constants = ref.watch(homeConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubTitleWidget(
              title: constants.txtName,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: constants.txtEnterName,
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            SubTitleWidget(
              title: constants.txtNumber,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: constants.txtWhatsappNumber,
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            SubTitleWidget(
              title: constants.txtAddress,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: constants.txtEnterAddress,
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            SubTitleWidget(
              title: constants.txtLocation,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: '',
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            SubTitleWidget(
              title: constants.txtBranch,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: '',
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            SubTitleWidget(
              title: constants.txtTotalAmount,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: '',
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            SubTitleWidget(
              title: constants.txtDiscountAmount,
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            TextFieldWidget(
              labelText: '',
              controller: controller,
            ),
            SizedBox(
              height: theme.spaces.space_400,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: theme.spaces.space_200),
              child:
                  ButtonWidget(buttonName: constants.txtSave, onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
