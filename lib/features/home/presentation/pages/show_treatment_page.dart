import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/features/home/presentation/provider/treatment_provider.dart';
import 'package:novi_indus_test/features/home/presentation/widgets/treatment_widget.dart';

class ShowTreatmentPage extends ConsumerWidget {
  const ShowTreatmentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = ref.watch(homeConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          constants.txtTreatmnts,
          style: theme.typography.h600.copyWith(fontSize: 24),
        ),
      ),
      body: ref.watch(treatmentProvider).isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ref.watch(treatmentProvider) == null
              ? const Text('NO DATA')
              : switch (ref.watch(treatmentProvider)) {
                  AsyncData(:final value) => ShowTreatmenteWidget(
                      entity: value,
                    ),
                  AsyncError(:final error, :final stackTrace) => Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colors.secondary),
                        onPressed: () {
                          ref.invalidate(treatmentProvider);
                        },
                        child: const Text(
                          'Retry',
                        ),
                      ),
                    ),
                  _ => const Center(
                      child: CircularProgressIndicator(),
                    )
                },
    );
  }
}
