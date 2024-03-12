import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novi_indus_test/core/constants/home_constants.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/features/home/domain/entity/patient_entity.dart';

class ListViewWidget extends ConsumerWidget {
  final List<PatientEntity> entity;
  const ListViewWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = ref.watch(homeConstantsProvider);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.3,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: entity.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: theme.spaces.space_250,
              vertical: theme.spaces.space_150,
            ),
            child: Container(
                height: theme.spaces.space_500 * 5,
                decoration: BoxDecoration(
                  color: theme.colors.textInverse,
                ),
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: theme.spaces.space_300,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: theme.spaces.space_200,
                        ),
                        Text(
                          entity[index].user,
                          style: theme.typography.h600.copyWith(
                            fontSize: theme.spaces.space_300,
                          ),
                        ),
                        Text(
                          entity[index].address,
                          style: theme.typography.h400.copyWith(
                            fontSize: theme.spaces.space_300,
                            color: theme.colors.primary,
                          ),
                        ),
                        SizedBox(
                          height: theme.spaces.space_150,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: theme.colors.textSubtlest,
                            ),
                            Text(
                              entity[index].name,
                              style: theme.typography.h300.copyWith(
                                fontSize: theme.spaces.space_250,
                                color: theme.colors.textSubtle,
                              ),
                            ),
                            SizedBox(
                              width: theme.spaces.space_200,
                            ),
                            Icon(
                              Icons.group,
                              color: theme.colors.textSubtlest,
                            ),
                            Text(
                              entity[index].name,
                              style: theme.typography.h300.copyWith(
                                fontSize: theme.spaces.space_250,
                                color: theme.colors.textSubtle,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        SizedBox(
                          height: theme.spaces.space_100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              constants.txtViewBooking,
                              style: theme.typography.h300.copyWith(
                                fontSize: theme.spaces.space_125 * 2,
                              ),
                            ),
                            Icon(
                              Icons.chevron_right,
                              color: theme.colors.primary,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
  }
}
