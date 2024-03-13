import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/features/home/presentation/provider/branch_provider.dart';
import 'package:novi_indus_test/features/home/presentation/widgets/braches_widget.dart';

class ShowBranchPage extends ConsumerWidget {
  const ShowBranchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = ref.watch(homeConstantsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          constants.txtBranches,
          style: theme.typography.h600.copyWith(fontSize: 24),
        ),
      ),
      body: ref.watch(branchProvider).isRefreshing
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ref.watch(branchProvider) == null
              ? const Text('NO DATA')
              : switch (ref.watch(branchProvider)) {
                  AsyncData(:final value) => ShowBrancheWidget(
                      entity: value,
                    ),
                  AsyncError(:final error, :final stackTrace) => Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: theme.colors.secondary),
                        onPressed: () {
                          ref.invalidate(branchProvider);
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
