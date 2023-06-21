import 'package:flutter/material.dart';
import 'package:sim/constants/dimensions.dart';

import '../../../../app_nav.dart';
import '../../../../constants/colors.dart';
import '../../../../data/models/course.dart';
import '../../courses/details/details.dart';

class RegisteredCoursesTab extends StatelessWidget {
  const RegisteredCoursesTab(this.courses, {super.key});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: AppDimensions.padding,
      crossAxisCount: 2,
      // mainAxisSpacing: ,
      children: courses
          .map(
            (e) => _AppStackedCard(
              course: e,
              backgroundImage: Image.asset('assets/images/css-logo.png'),
            ),
          )
          .toList(),
    );
  }
}

class _AppStackedCard extends StatelessWidget {
  const _AppStackedCard({
    required this.course,
    required this.backgroundImage,
  });

  final Course course;
  final Image backgroundImage;

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
            child: backgroundImage,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: 60,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: AppDimensions.paddingUnitS,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(.85),
                borderRadius: const BorderRadius.all(Radius.circular(26)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${course.courseCode}',
                    style: textTheme.headline3?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    course.status ?? 'status',
                    style: textTheme.subtitle2,
                  ),
                  AppDimensions.vSpacingS,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
