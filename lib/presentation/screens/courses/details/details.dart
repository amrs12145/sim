// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/presentation/screens/staff/staff.dart';
import 'package:sim/presentation/widgets/loading.dart';
import 'package:sim/routes.dart';

import '../../../../buisness_logic/cubit/course_details/course_details_cubit.dart';
import '../../../../data/models/course.dart';
import '../../../../data/models/course_details.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen(this.course, {super.key});
  final Course course;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  @override
  void initState() {
    context
        .read<CourseDetailsCubit>()
        .getCourseDetails(widget.course.courseCode);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final prov = context.read<CourseDetailsCubit>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocBuilder<CourseDetailsCubit, CourseDetailsState>(
        builder: (context, state) {
          if (state is Initial) prov.getCourseDetails(widget.course.courseCode);
          if (state is Loading) return const LoadingWidget();
          if (state is Loaded) {
            final professors = state.courseDetails.staffs
                .where((e) => e.title == 'professor')
                .toList();
            final instructors = state.courseDetails.staffs
                .where((e) => e.title == 'instructor')
                .toList();

            return Column(
              children: [
                _KAppBar(state.courseDetails),
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
                              'Code: ',
                              style: textTheme.headline2?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            Text('${state.courseDetails.courseCode}'),
                          ],
                        ),
                        AppDimensions.vSpacing,
                        Text(
                          'Description: ',
                          style: textTheme.headline2?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        AppDimensions.vSpacingS,
                        Text(
                          state.courseDetails.briefInfo,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black87,
                          ),
                        ),
                        AppDimensions.vSpacing,
                        _ExpandableCard(
                          isExpanded: true,
                          title: Text(
                            'Professors',
                            style: textTheme.headline3?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          children: professors
                              .map(
                                (e) => ListTile(
                                  onTap: () {
                                    AppNav.push(context, StaffScreen(e));
                                  },
                                  title: Text(
                                    e.name,
                                    style: textTheme.subtitle1?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  subtitle: Text(e.title),
                                  trailing: Image.network(e.img ?? ''),
                                ),
                              )
                              .toList(),
                        ),
                        AppDimensions.vSpacingS,
                        _ExpandableCard(
                          isExpanded: true,
                          title: Text(
                            'Instructors',
                            style: textTheme.headline3?.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          children: instructors
                              .map(
                                (e) => ListTile(
                                  onTap: () {
                                    AppNav.push(context, StaffScreen(e));
                                  },
                                  title: Text(
                                    e.name,
                                    style: textTheme.subtitle1?.copyWith(
                                      fontSize: 16,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  subtitle: Text(e.title),
                                  trailing: Image.network(e.img ?? ''),
                                ),
                              )
                              .toList(),
                        ),
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

class _ExpandableCard extends StatefulWidget {
  const _ExpandableCard(
      {required this.title, required this.children, this.isExpanded = false});

  final Widget title;
  final List<Widget> children;
  final bool isExpanded;

  @override
  State<_ExpandableCard> createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<_ExpandableCard> {
  late bool _isExpanded;

  @override
  void initState() {
    _isExpanded = widget.isExpanded;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: _isExpanded,
          onExpansionChanged: (_) {
            setState(() => _isExpanded = !_isExpanded);
          },
          title: widget.title,
          trailing: Icon(
            _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: AppColors.primary,
          ),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          tilePadding: AppDimensions.paddingS,
          childrenPadding: AppDimensions.padding,
          children: widget.children,
        ),
      ),
    );
  }
}

class _KAppBar extends StatelessWidget {
  const _KAppBar(this.courseDetails);
  final CourseDetails courseDetails;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: AppColors.primary,
        image: DecorationImage(
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
                  courseDetails.name,
                  style: textTheme.headline2?.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppDimensions.hSpacing,
              const Icon(Icons.timelapse, size: 20, color: AppColors.grey),
              AppDimensions.hSpacing,
              AppDimensions.hSpacing,
              Text(
                '${courseDetails.creditHours} Hours | ',
                style: textTheme.subtitle2?.copyWith(color: AppColors.white),
              ),
              Text(
                courseDetails.type,
                style: textTheme.subtitle2?.copyWith(color: AppColors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
