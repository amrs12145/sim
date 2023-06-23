import 'package:flutter/material.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/routes.dart';

import '../../constants/colors.dart';
import '../../constants/dimensions.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    required this.name,
    required this.date,
    this.listOfTabs,
    this.onPressed,
    super.key,
  });

  final String name;
  final DateTime date;

  /// List of [count,'Title']
  /// Example: [ [13,'Active'], [15,'Pending'], [21,'Completed'] ]
  final List<List<dynamic>>? listOfTabs;
  final Function(int)? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  var _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: AppDimensions.padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.date.md, style: textTheme.subtitle2),
                    Text(
                      'Hey, ${widget.name}',
                      style: textTheme.subtitle1?.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    AppNav.push(context, AppRoutes.profile);
                  },
                  child: Image.asset('assets/images/male-avatar.png'),
                ),
              ],
            ),
          ),
          if (widget.listOfTabs != null)
            Padding(
              padding: AppDimensions.paddingS,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < widget.listOfTabs!.length; i++)
                    _buildTabButton(
                      i,
                      widget.listOfTabs![i].first,
                      widget.listOfTabs![i].last,
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTabButton(
    int index,
    int count,
    String status,
  ) =>
      Expanded(
        child: TextButton(
          onPressed: () {
            setState(
              () {
                _selectedTab = index;
                if (widget.onPressed != null) widget.onPressed!(_selectedTab);
              },
            );
          },
          style: _selectedTab == index
              ? TextButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: AppDimensions.paddingV,
                  shape: AppDimensions.roundBorderS,
                )
              : null,
          child: Column(
            children: [
              Text(
                '$count',
                style: TextStyle(
                  fontSize: 20,
                  color: _selectedTab == index
                      ? AppColors.onPrimary
                      : AppColors.black,
                ),
              ),
              Text(
                status,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                      color: _selectedTab == index
                          ? AppColors.onPrimary
                          : Colors.grey,
                    ),
              ),
            ],
          ),
        ),
      );
}
