import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sim/buisness_logic/cubit/course_details/course_details_cubit.dart';
import 'package:sim/buisness_logic/cubit/courses/cubit.dart';
import 'package:sim/routes.dart';

import 'api/dio.dart';
import 'buisness_logic/cubit/admin/admin_cubit.dart';
import 'buisness_logic/cubit/home/cubit.dart';
import 'buisness_logic/cubit/login/cubit.dart';
import 'buisness_logic/cubit/profile/profile_cubit.dart';
import 'buisness_logic/cubit/sign_up/cubit.dart';
import 'buisness_logic/cubit/staff/staff_cubit.dart';
import 'constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CallApi.setToken();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: LoginCubit()),
        BlocProvider.value(value: HomeCubit()),
        BlocProvider.value(value: CoursesCubit()),
        BlocProvider.value(value: CourseDetailsCubit()),
        BlocProvider.value(value: StaffCubit()),
        BlocProvider.value(value: SignUpCubit()),
        BlocProvider.value(value: HomeCubit()),
        BlocProvider.value(value: ProfileCubit()),
        BlocProvider.value(value: AdminCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getMyThemeData(),
            home: AppRoutes.landing,
          );
        },
      ),
    );
  }
}
