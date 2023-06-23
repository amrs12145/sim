import 'package:flutter/material.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/data/models/staff.dart';
import 'package:sim/presentation/screens/courses/courses_list.dart';
import 'package:sim/presentation/screens/courses/details/details.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants/colors.dart';
import '../../constants/dimensions.dart';
import '../../data/models/course.dart';
import '../../data/models/field.dart';

class AppStackedCard extends StatelessWidget {
  const AppStackedCard({
    this.field,
    this.course,
    this.professor,
    this.onTap,
    super.key,
  });

  final Field? field;
  final Course? course;
  final Staff? professor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    assert(field != null || course != null || professor != null);

    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.grey,
      child: InkWell(
        onTap: onTap ??
            () {
              if (field != null) {
                AppNav.push(context, CourseCatalog(field!));
              } else {
                AppNav.push(context, CourseDetailsScreen(course!));
              }
            },
        borderRadius: AppDimensions.borderRadiusS,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            if (professor != null)
              Image.network(
                professor!.img?.driveLink() ??
                    'https://admissionado.com/wp-content/uploads/2016/04/college_professors_blog_post.jpg',
              ),
            if (professor == null)
              WebsafeSvg.network(
                field?.img!.driveLink() ?? course!.img!.driveLink(),
                width: field?.name != null ? size.width * .4 : size.width * 3,
                fit: BoxFit.contain,
              ),
            Positioned(
              bottom: 0,
              child: Container(
                width: field?.name != null ? size.width - 65 : 170,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingUnit,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // color: AppColors.primary.withOpacity(.8),
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: field?.name != null
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    AppDimensions.vSpacing,
                    Text(
                      field?.name ?? course?.name! ?? professor!.name,
                      textAlign: TextAlign.center,
                      style: field?.name != null
                          ? textTheme.headline3?.copyWith(
                              color: AppColors.primary,
                            )
                          : textTheme.subtitle2?.copyWith(
                              color: AppColors.black,
                              fontSize: 13,
                            ),
                    ),
                    AppDimensions.vSpacingS,
                    Text(
                      field?.description ?? course?.type ?? professor!.degree,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                      ),
                    ),
                    if (field != null)
                      Padding(
                        padding: AppDimensions.paddingH,
                        child: Row(
                          children: [
                            Expanded(
                              child: LinearProgressIndicator(
                                value: field?.progress?.toDouble() ?? 0,
                                color: AppColors.black,
                                backgroundColor: Colors.grey,
                                minHeight: 2,
                              ),
                            ),
                            AppDimensions.hSpacing,
                            OutlinedButton(
                              onPressed: () {
                                AppNav.push(context, CourseCatalog(field!));
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.grey,
                                side: const BorderSide(color: Colors.white),
                                shape: AppDimensions.roundBorder,
                              ),
                              child: const Row(
                                children: [
                                  Text('View'),
                                  Icon(Icons.arrow_forward),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
