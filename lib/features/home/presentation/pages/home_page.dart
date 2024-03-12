import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/core/widgets/button_widget.dart';
import 'package:novi_indus_test/core/widgets/text_field_widget.dart';
import 'package:novi_indus_test/features/home/presentation/widgets/listview_widge.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final searchController = TextEditingController();
    final constants = ref.watch(homeConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              labelText: constants.txtSearchField,
              iconData: Icon(Icons.search),
              controller: searchController,
            ),
            ListViewWidget(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          ButtonWidget(buttonName: constants.txtRegister, onPressed: () {}),
    );
  }
}
