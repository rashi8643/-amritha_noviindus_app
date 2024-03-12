import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/core/widgets/button_widget.dart';
import 'package:novi_indus_test/features/home/presentation/pages/registeration_page.dart';
import 'package:novi_indus_test/features/home/presentation/provider/home_provider.dart';
import 'package:novi_indus_test/features/home/presentation/widgets/container_widget.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerWidget(
              text: constants.txtShowBranches,
              onTap: () {},
            ),
            ContainerWidget(
              text: constants.txtShowTreatments,
              onTap: () {},
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
              child: Text(
                constants.txtPatientDetails,
                style: theme.typography.h600.copyWith(
                  fontSize: theme.spaces.space_250,
                ),
              ),
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
