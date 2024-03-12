import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/core/widgets/button_widget.dart';
import 'package:novi_indus_test/core/widgets/text_field_widget.dart';
import 'package:novi_indus_test/features/home/presentation/pages/registeration_page.dart';
import 'package:novi_indus_test/features/home/presentation/provider/home_provider.dart';
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
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFieldWidget(
              labelText: constants.txtSearchField,
              iconData: const Icon(Icons.search),
              controller: searchController,
            ),
            ref.watch(homeProvider).isRefreshing
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ref.watch(homeProvider) == null
                    ? const Text('NO DATA')
                    : switch (ref.watch(homeProvider)) {
                        AsyncData(:final value) => ListViewWidget(
                            entity: value!,
                          ),
                        AsyncError(:final error, :final stackTrace) => Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.colors.secondary),
                              onPressed: () {
                                ref.invalidate(homeProvider);
                              },
                              child: const Text(
                                'Retry',
                              ),
                            ),
                          ),
                        _ => const Center(
                            child: CircularProgressIndicator(),
                          )
                      }
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ButtonWidget(
          buttonName: constants.txtRegister,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RegisterationPage(),
              ),
            );
          }),
    );
  }
}
