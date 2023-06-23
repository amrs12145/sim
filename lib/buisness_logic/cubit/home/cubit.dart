// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sim/data/net/home.dart';
import 'package:sim/data/net/users.dart';

import '../../../data/models/course.dart';
import '../../../data/models/field.dart';

part 'state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  loadAll() async {
    emit(HomeLoading());

    final fields = await HomeService.loadFields();
    final courses = await HomeService.loadCourses();
    final availableCourses = await HomeService.loadAvailableCourses();

    if (fields.isSuccess && courses.isSuccess && availableCourses.isSuccess) {
      emit(
        HomeLoaded(
          fields.dataModel!,
          courses.dataModel!,
          availableCourses.dataModel!,
        ),
      );
    } else
      emit(
        HomeFailed(
          '${fields.message}'
          '${courses.message}'
          '${availableCourses.message}',
        ),
      );
  }

  getFieldCourses(String fieldName) async {
    emit(HomeLoading());
    final res = await HomeService.loadFieldCourses(fieldName);

    if (res.isSuccess)
      emit(HomeCourses(res.dataModel!));
    else
      emit(HomeFailed(res.message));
  }

  logOut() async {
    emit(HomeLoading());

    final res = await LoginService.logOut();

    if (res.isSuccess)
      emit(HomeLogOut());
    else
      emit(HomeFailed(res.message));
  }
}
