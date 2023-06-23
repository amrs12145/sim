// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/course.dart';
import '../../../data/net/home.dart';

part 'states.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(Initial());

  getCourses(String fieldName) async {
    emit(Loading());
    final res = await HomeService.loadFieldCourses(fieldName);

    if (res.isSuccess)
      emit(CoursesLoaded(res.dataModel!));
    else
      emit(Failed(res.message));
  }
}
