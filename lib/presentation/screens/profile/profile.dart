// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/presentation/widgets/loading.dart';

import '../../../buisness_logic/cubit/profile/profile_cubit.dart';
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
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                AppNav.pop(context);
              },
            ),
            title: Text('My Profile'),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(204, 197, 199, 0.2),
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is Initial) prov.getRegisteredCourses();
              if (state is Loading) return LoadingWidget();

              if (state is Loaded) {
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.15,
                      padding: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(204, 197, 199, 0.2),
                      ),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: AppDimensions.paddingS,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage:
                                AssetImage('assets/images/male-avatar.png'),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Container(
                        width: double.infinity,
                        color: Color.fromRGBO(
                          204,
                          197,
                          199,
                          0.2,
                        ), // Change the background color here
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Text(
                                'Amr Samy',
                                style: textTheme.subtitle1?.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                            ),
                            AppDimensions.vSpacing,
                          ],
                        ),
                      ),
                    ),
                    AppDimensions.vSpacing,
                    Padding(
                      padding: AppDimensions.paddingS,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: TabBar(
                          controller: tabController,
                          tabs: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFF2377CF),
                              ),
                              child: Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'score',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFF2377CF),
                              ),
                              child: Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Registered Courses',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color(0xFF2377CF),
                              ),
                              child: Tab(
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'badge',
                                    textAlign: TextAlign.center,
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
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ScoreTab(3.2, 70.0),
                          RegisteredCoursesTab(state.courses),
                          Center(
                            child: Text('Tab 3 Content'),
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
