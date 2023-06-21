// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/dimensions.dart';
import '../../../buisness_logic/cubit/home/cubit.dart';
import '../../widgets/app_stacked_card.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/loading.dart';
import '../auth/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HomeCubit>().getFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final prov = context.read<HomeCubit>();

    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is HomeLogOut)
            AppNav.pushAndRemoveUntil(context, const LoginScreen());
        },
        builder: (context, state) {
          if (state is HomeInitial) prov.getFields();

          if (state is HomeFields)
            return ListView(
              shrinkWrap: true,
              padding: AppDimensions.paddingS,
              children: [
                CustomAppBar(
                  name: 'Amr',
                  date: DateTime.now(),
                  listOfTabs: const [
                    [13, 'Active'],
                    [15, 'Pending'],
                    [21, 'Completed'],
                  ],
                ),
                ...state.fields
                    .map(
                      (field) => SizedBox(
                        height: 200,
                        child: AppStackedCard(
                          filed: field,
                        ),
                      ),
                    )
                    .toList(),
              ],
            );

          return Text('Error');
        },
      ),
    );
  }
}
