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

  getFields() async {
    emit(HomeLoading());

    final res = await HomeService.loadFields();

    if (res.isSuccess) {
      emit(HomeFields(res.dataModel!));
    } else
      emit(HomeFailed(res.message));
  }

  getCourses(String fieldName) async {
    emit(HomeLoading());
    final res = await HomeService.loadCourse(fieldName);

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
