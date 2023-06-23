// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/loading.dart';
import 'package:sim/routes.dart';

import '../../../buisness_logic/cubit/profile/profile_cubit.dart';
import 'tabs/active_course.dart';
import 'tabs/registered_courses.dart';
import 'tabs/score.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final prov = context.read<ProfileCubit>();

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (state is Initial) prov.loadAll();
              if (state is Loading) return LoadingWidget();

              if (state is Loaded) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      padding: EdgeInsets.only(top: 36),
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                      ),
                      child: Padding(
                        padding: AppDimensions.padding,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                AppNav.pop(context);
                              },
                            ),
                            AppDimensions.hSpacing,
                            InkWell(
                              onTap: () {
                                AppNav.push(context, AppRoutes.admin);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    state.studentInfo.name,
                                    style: textTheme.subtitle1?.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        state.studentInfo.type.capitalize(),
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blue.shade900,
                                        ),
                                      ),
                                      if (state.studentInfo.type == 'admin')
                                        Icon(
                                          Icons.add_moderator,
                                          size: 20,
                                          color: Colors.blue.shade900,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                'assets/images/male-avatar.png',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppDimensions.vSpacingS,
                    AppDimensions.vSpacingS,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: AppDimensions.borderRadiusS,
                      ),
                      child: TabBar(
                        controller: tabController,
                        onTap: (_) => setState(() {}),
                        tabs: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: AppDimensions.borderRadiusS,
                              color: tabController.index == 0
                                  ? Colors.blue.shade700
                                  : null,
                              border: Border.all(color: Colors.blue.shade700),
                            ),
                            child: Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Score',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: tabController.index == 0
                                        ? null
                                        : Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: AppDimensions.borderRadiusS,
                              color: tabController.index == 1
                                  ? Colors.blue.shade700
                                  : null,
                              border: Border.all(color: Colors.blue.shade700),
                            ),
                            child: Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Passed Courses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: tabController.index == 1
                                        ? null
                                        : Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: AppDimensions.borderRadiusS,
                              color: tabController.index == 2
                                  ? Colors.blue.shade700
                                  : null,
                              border: Border.all(color: Colors.blue.shade700),
                            ),
                            child: Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Active Courses',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: tabController.index == 2
                                        ? null
                                        : Colors.blue.shade700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ScoreTab(
                            state.studentInfo.details,
                          ),
                          FinishedCoursesTab(
                            state.courses
                                .where((e) => e.pivotStatus == "finished")
                                .toList(),
                          ),
                          ActiveCoursesTab(
                            state.courses
                                .where((e) => e.pivotStatus == "active")
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return Text('Error');
            },
          ),
        );
      },
    );
  }
}
