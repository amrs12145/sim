// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/screens/staff/staff.dart';
import 'package:sim/presentation/widgets/loading.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../buisness_logic/cubit/course_details/course_details_cubit.dart';
import '../../../../data/models/course.dart';
import '../../../../data/models/course_details.dart';
import '../../../../data/models/staff.dart';
import '../../../widgets/expandable_card.dart';

class CourseDetailsScreen extends StatefulWidget {
  const CourseDetailsScreen(
    this.course, {
    this.professorsToAttach,
    super.key,
  });

  final Course course;
  final List<Staff>? professorsToAttach;

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  List<Staff>? attachProfessors;
  List<Staff>? attachInstructors;

  @override
  void initState() {
    context
        .read<CourseDetailsCubit>()
        .getCourseDetails(widget.course.courseCode);

    attachProfessors = widget.professorsToAttach
        ?.where((e) => e.title == 'professor')
        .toList();
    attachInstructors = widget.professorsToAttach
        ?.where((e) => e.title == 'instructor')
        .toList();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final prov = context.read<CourseDetailsCubit>();

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: BlocConsumer<CourseDetailsCubit, CourseDetailsState>(
        listener: (context, state) {
          if (state is Failed)
            QuickAlert.show(
              context: context,
              type: QuickAlertType.error,
              title: state.message,
            );
          if (state is RegisteredCourse)
            QuickAlert.show(
              context: context,
              type: QuickAlertType.success,
              title: 'Course has been registered Successfully',
            );
        },
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
                        AppDimensions.vSpacingS,
                        Text(
                          'Description: ',
                          style: textTheme.headline2?.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        AppDimensions.vSpacingS,
                        Text(
                          state.courseDetails.briefInfo,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black.withOpacity(.7),
                          ),
                        ),
                        AppDimensions.vSpacing,
                        if (widget.professorsToAttach != null) ...[
                          ExpandableCard(
                            isExpanded: true,
                            title: Text(
                              'Attach Professors',
                              style: textTheme.headline3?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            children: attachProfessors!
                                .map(
                                  (e) => ListTile(
                                    onTap: () async {
                                      prov.attachCourse(
                                        state.courseDetails.courseCode,
                                        e.email,
                                      );
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        text: 'Attached ${e.name}',
                                      );
                                      setState(
                                        () => attachProfessors!.remove(e),
                                      );
                                    },
                                    title: Text(
                                      e.name,
                                      style: textTheme.subtitle1?.copyWith(
                                        fontSize: 16,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    subtitle: Text(e.title),
                                    trailing: Image.network(
                                      'https://admissionado.com/wp-content/uploads/2016/04/college_professors_blog_post.jpg',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          AppDimensions.vSpacingS,
                          ExpandableCard(
                            isExpanded: true,
                            title: Text(
                              'Attach Teaching Assistants',
                              style: textTheme.headline3?.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            children: attachInstructors!
                                .map(
                                  (e) => ListTile(
                                    onTap: () async {
                                      prov.attachCourse(
                                        state.courseDetails.courseCode,
                                        e.email,
                                      );
                                      await QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.success,
                                        text: 'Attached ${e.name}',
                                      );
                                      setState(
                                        () => attachInstructors!.remove(e),
                                      );
                                    },
                                    title: Text(
                                      e.name,
                                      style: textTheme.subtitle1?.copyWith(
                                        fontSize: 16,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    subtitle: Text(e.title),
                                    trailing: Image.network(
                                      'https://admissionado.com/wp-content/uploads/2016/04/college_professors_blog_post.jpg',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          AppDimensions.vSpacing,
                        ] else ...[
                          ExpandableCard(
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
                                    trailing: Image.network(
                                      'https://admissionado.com/wp-content/uploads/2016/04/college_professors_blog_post.jpg',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          AppDimensions.vSpacingS,
                          ExpandableCard(
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
                                    trailing: Image.network(
                                      'https://admissionado.com/wp-content/uploads/2016/04/college_professors_blog_post.jpg',
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          AppDimensions.vSpacing,
                          ElevatedButton(
                            onPressed: () {
                              if (widget.course.material != null) {
                                final controller = WebViewController()
                                  ..loadRequest(
                                    Uri.parse(widget.course.material!),
                                  );

                                AppNav.push(
                                  context,
                                  WebViewWidget(
                                    controller: controller,
                                  ),
                                );
                              }
                            },
                            child: const Text('View Material'),
                          ),
                          AppDimensions.vSpacingS,
                          AppDimensions.vSpacingS,
                          if (state.courseDetails.status == "available") ...[
                            ElevatedButton(
                              onPressed: () {
                                prov.registerCourse(
                                  state.courseDetails.courseCode,
                                  1,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green[600],
                              ),
                              child: const Text('Register Course'),
                            ),
                          ],
                        ],
                        if (widget.professorsToAttach != null) ...[
                          UnconstrainedBox(
                            child: ElevatedButton.icon(
                              onPressed: () async {
                                final res = await prov.toggleCourseStatus(
                                  state.courseDetails.courseCode,
                                );

                                if (res) {
                                  state.courseDetails.status =
                                      state.courseDetails.status == "available"
                                          ? 'unavailable'
                                          : 'available';

                                  setState(
                                    () {
                                      state.courseDetails.status ==
                                              'unavailable'
                                          ? QuickAlert.show(
                                              context: context,
                                              type: QuickAlertType.error,
                                              title: 'Closed Enrollement',
                                              confirmBtnColor: AppColors.danger,
                                            )
                                          : QuickAlert.show(
                                              context: context,
                                              type: QuickAlertType.success,
                                              title: 'Open Enrollement',
                                              confirmBtnColor:
                                                  AppColors.success,
                                            );
                                    },
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    state.courseDetails.status == 'unavailable'
                                        ? AppColors.success
                                        : AppColors.danger,
                                fixedSize: const Size(185.0, 48.0),
                              ),
                              icon: state.courseDetails.status == 'unavailable'
                                  ? const Icon(Icons.check)
                                  : const Icon(Icons.close),
                              label: Text(
                                state.courseDetails.status == 'unavailable'
                                    ? 'Open Enrollement'
                                    : 'Close Enrollement',
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is RegisteredCourse) {
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
                        ExpandableCard(
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
                        ExpandableCard(
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
                        AppDimensions.vSpacing,
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('View Material'),
                        ),
                        AppDimensions.vSpacingS,
                        AppDimensions.vSpacingS,
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          prov.getCourseDetails(widget.course.courseCode);
          return const Text('Error');
        },
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
      height: 180,
      padding: const EdgeInsets.only(top: 45),
      child: Stack(
        children: [
          Center(
            child: WebsafeSvg.network(
              courseDetails.img.driveLink(),
              fit: BoxFit.contain,
            ),
          ),
          Column(
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
                      style:
                          textTheme.headline2?.copyWith(color: AppColors.white),
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
                    style:
                        textTheme.subtitle2?.copyWith(color: AppColors.white),
                  ),
                  Text(
                    courseDetails.type,
                    style:
                        textTheme.subtitle2?.copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
