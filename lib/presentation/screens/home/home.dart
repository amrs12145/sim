// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/screens/add_field/add_field.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../buisness_logic/cubit/home/cubit.dart';
import '../../../data/models/course.dart';
import '../../widgets/app_stacked_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../courses/details/details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final prov = context.read<HomeCubit>();

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniEndDocked,
          floatingActionButton: (state is HomeLoaded)
              ? FloatingActionButton(
                  onPressed: () {
                    AppNav.push(
                      context,
                      AddFieldScreen(state.fields),
                    );
                  },
                  backgroundColor: AppColors.background,
                  child: const Icon(
                    Icons.favorite_border,
                    color: AppColors.primary,
                  ),
                )
              : null,
          body: Builder(
            builder: (context) {
              if (state is HomeInitial) prov.loadAll();

              if (state is HomeLoaded) {
                return Container(
                  padding: AppDimensions.paddingS,
                  child: Column(
                    children: [
                      CustomAppBar(
                        onPressed: (p0) {
                          setState(() => _index = p0);
                        },
                        name: 'Amr',
                        date: DateTime.now(),
                        listOfTabs: [
                          [state.fields.length, 'Tracks'],
                          [state.courses.length, 'Courses'],
                          [state.availableCourses.length, 'Register'],
                        ],
                      ),
                      Expanded(
                        child: (_index == 0)
                            ? ListView(
                                children: state.fields
                                    .map(
                                      (field) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 32.0),
                                        child: SizedBox(
                                          height: 250,
                                          child: AppStackedCard(
                                            field: field,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : (_index == 1)
                                ? GridView.count(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 56.0,
                                    ),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 30,
                                    mainAxisSpacing: 50,
                                    children: state.courses
                                        .map(
                                          (course) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0.0),
                                            child: AppStackedCard(
                                              course: course,
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  )
                                : GridView.count(
                                    padding: AppDimensions.padding,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 10,
                                    children: (state.availableCourses
                                          ..sort((a, b) =>
                                              b.score!.compareTo(a.score!)))
                                        .map(
                                          (e) => _AppStackedCard(course: e),
                                        )
                                        .toList(),
                                  ),
                      ),
                    ],
                  ),
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

class _AppStackedCard extends StatelessWidget {
  const _AppStackedCard({
    this.course,
    this.onTap,
    super.key,
  });

  final Course? course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: AppColors.grey,
      child: InkWell(
        onTap: () {
          AppNav.push(context, CourseDetailsScreen(course!));
        },
        borderRadius: AppDimensions.borderRadiusS,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            WebsafeSvg.network(
              course!.img!.driveLink(),
              width: size.width * 3,
              fit: BoxFit.contain,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 170,
                padding: EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingUnit,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // color: AppColors.primary.withOpacity(.8),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppDimensions.vSpacing,
                    Text(
                      course!.name!,
                      textAlign: TextAlign.center,
                      style: textTheme.subtitle2?.copyWith(
                        color: AppColors.black,
                        fontSize: 13,
                      ),
                    ),
                    AppDimensions.vSpacingS,
                    Text(
                      course!.type!,
                      style: const TextStyle(
                        color: AppColors.black,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (course!.score != null)
              Positioned(
                top: 0,
                right: -4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.blue.shade800,
                      size: 45,
                    ),
                    Transform.translate(
                      offset: const Offset(2, -2),
                      child: Text(
                        '${(course!.score! * 12).toStringFixed(0)}%',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
