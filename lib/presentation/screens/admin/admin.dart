import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/presentation/screens/courses/details/details.dart';

import '../../../buisness_logic/cubit/admin/admin_cubit.dart';
import '../../../constants/dimensions.dart';
import '../../widgets/app_stacked_card.dart';
import '../../widgets/custom_app_bar.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  var _index = 0;

  @override
  Widget build(BuildContext context) {
    final prov = context.read<AdminCubit>();

    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (state is AdminInitial) prov.loadAll();

              if (state is AdminLoaded) {
                return Padding(
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
                          [state.professors.length, 'Professors'],
                          [state.fields.length, 'Tracks'],
                          [state.courses.length, 'Courses'],
                        ],
                      ),
                      Expanded(
                        child: (_index == 0)
                            ? ListView(
                                children: state.professors
                                    .map(
                                      (professor) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 32.0),
                                        child: SizedBox(
                                          height: 250,
                                          child: AppStackedCard(
                                            onTap: () {},
                                            professor: professor,
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              )
                            : (_index == 1)
                                ? ListView(
                                    children: state.fields
                                        .map(
                                          (field) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 32.0),
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
                                : GridView.count(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
                                      vertical: 56.0,
                                    ),
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20,
                                    children: state.courses
                                        .map(
                                          (course) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 0.0),
                                            child: AppStackedCard(
                                              onTap: () {
                                                AppNav.push(
                                                  context,
                                                  CourseDetailsScreen(
                                                    course,
                                                    professorsToAttach:
                                                        state.professors,
                                                  ),
                                                );
                                              },
                                              course: course,
                                            ),
                                          ),
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
