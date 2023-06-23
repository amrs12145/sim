import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/core/extensions.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../app_nav.dart';
import '../../../buisness_logic/cubit/staff/staff_cubit.dart';
import '../../../constants/colors.dart';
import '../../../constants/dimensions.dart';
import '../../../data/models/course.dart';
import '../../../data/models/staff.dart';
import '../../widgets/expandable_card.dart';
import '../../widgets/loading.dart';
import '../courses/details/details.dart';

class StaffScreen extends StatefulWidget {
  const StaffScreen(this.staff, {super.key});
  final Staff staff;

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  void initState() {
    context.read<StaffCubit>();
    // .getCourseDetails(widget.course.courseCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final prov = context.read<StaffCubit>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocBuilder<StaffCubit, StaffState>(
        builder: (context, state) {
          if (state is Initial) prov.getCourses(widget.staff.email);
          if (state is Loading) return const LoadingWidget();
          if (state is Loaded) {
            return Column(
              children: [
                _KAppBar(widget.staff),
                AppDimensions.vSpacing,
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: ListView(
                      padding: AppDimensions.padding,
                      children: [
                        AppDimensions.vSpacing,
                        Row(
                          children: [
                            Text(
                              'Department: ',
                              style: textTheme.headline3?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              widget.staff.department,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        AppDimensions.vSpacing,
                        Row(
                          children: [
                            Text(
                              'Title: ',
                              style: textTheme.headline3?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              widget.staff.verboseTitle,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        AppDimensions.vSpacing,
                        Row(
                          children: [
                            Text(
                              'Email: ',
                              style: textTheme.headline3?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              widget.staff.email,
                              style: const TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        AppDimensions.vSpacing,
                        if (widget.staff.phoneNumber != null) ...[
                          Row(
                            children: [
                              Text(
                                'Phone: ',
                                style: textTheme.headline3?.copyWith(
                                  color: AppColors.primary,
                                ),
                              ),
                              Text(
                                widget.staff.phoneNumber!,
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          AppDimensions.vSpacing,
                        ],
                        ExpandableCard(
                          isExpanded: true,
                          title: Text(
                            'Courses',
                            style: textTheme.headline2?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          children: state.courses
                              .map(
                                (e) => ListTile(
                                  onTap: () {
                                    AppNav.push(
                                        context, CourseDetailsScreen(e));
                                  },
                                  title: Text(
                                    e.name!,
                                    style: textTheme.subtitle1?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  subtitle: Text(e.type!),
                                  trailing: WebsafeSvg.network(
                                    e.img!.driveLink(),
                                    width: 80,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        AppDimensions.vSpacing,
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}

class _KAppBar extends StatelessWidget {
  const _KAppBar(this.staff);
  final Staff staff;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.primary,
        image: const DecorationImage(
          image: AssetImage('assets/images/html-logo.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  AppNav.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 20, color: AppColors.grey),
              ),
              Expanded(
                // width: 300,
                child: Text(
                  staff.name,
                  style: textTheme.headline2?.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppDimensions.hSpacing,
              const Icon(Icons.school, color: AppColors.grey),
              AppDimensions.hSpacing,
              AppDimensions.hSpacing,
              Text(
                staff.degree,
                style: textTheme.subtitle2?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
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
            bottom: 70,
            child: backgroundImage,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: size.width,
              height: 70,
              padding: EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingUnit,
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
                    course.name!,
                    style: textTheme.headline3?.copyWith(
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    course.type!,
                    style: textTheme.subtitle2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
