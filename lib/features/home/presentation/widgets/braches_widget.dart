import 'package:flutter/material.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';
import 'package:novi_indus_test/features/home/domain/entity/branch_entity.dart';

class ShowBrancheWidget extends StatelessWidget {
  final List<BranchEntity> entity;
  const ShowBrancheWidget({super.key, required this.entity});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(theme.spaces.space_100),
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
                          entity[index].name,
                          style: theme.typography.h600.copyWith(
                            fontSize: theme.spaces.space_300,
                          ),
                        ),
                        Text(
                          'Mob : ${entity[index].phone}',
                          style: theme.typography.h400.copyWith(
                            fontSize: theme.spaces.space_250,
                            color: theme.colors.primary,
                          ),
                        ),
                        SizedBox(
                          height: theme.spaces.space_150,
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      ),
    );
    ;
  }
}
