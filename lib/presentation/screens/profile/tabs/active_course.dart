import 'package:flutter/material.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../../app_nav.dart';
import '../../../../constants/colors.dart';
import '../../../../data/models/course.dart';
import '../../courses/details/details.dart';

class ActiveCoursesTab extends StatelessWidget {
  const ActiveCoursesTab(this.courses, {super.key});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: AppDimensions.padding,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      children: courses
          .map(
            (e) => _AppStackedCard(
              course: e,
            ),
          )
          .toList(),
    );
  }
}

class _AppStackedCard extends StatelessWidget {
  const _AppStackedCard({
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        AppNav.push(context, CourseDetailsScreen(course));
      },
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            bottom: 60,
            child: WebsafeSvg.network(
              course.img!.driveLink(),
              width: 100,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: 55,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: AppDimensions.paddingUnitS,
              ),
              decoration: BoxDecoration(
                color: Colors.blue.shade600.withOpacity(.75),
                borderRadius: AppDimensions.borderRadius,
              ),
              child: Text(
                course.name!,
                textAlign: TextAlign.center,
                style: textTheme.headline3?.copyWith(
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
