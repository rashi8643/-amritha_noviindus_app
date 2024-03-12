import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novi_indus_test/core/theme/app_theme.dart';

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 1.3,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
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
                          "data",
                          style: theme.typography.h600.copyWith(
                            fontSize: theme.spaces.space_300,
                          ),
                        ),
                        Text(
                          "rue;jfwefhlfsdiafayfndkand",
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
                              "31/12/2222",
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
                              "data",
                              style: theme.typography.h300.copyWith(
                                fontSize: theme.spaces.space_250,
                                color: theme.colors.textSubtle,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        SizedBox(
                          height: theme.spaces.space_100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "View Booking details",
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
