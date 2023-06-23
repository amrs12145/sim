// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/course_details.dart';
import '../../../data/net/course_details.dart';

part 'course_details_state.dart';

class CourseDetailsCubit extends Cubit<CourseDetailsState> {
  CourseDetailsCubit() : super(Initial());

  getCourseDetails(int code) async {
    emit(Loading());
    final res = await CourseService.loadCourseDetails('$code');

    if (res.isSuccess)
      emit(Loaded(res.dataModel!));
    else
      emit(Failed(res.message ?? 'Error'));
  }

  registerCourse(int code, int semester) async {
    var oldState = state;
    emit(Loading());
    final res = await CourseService.registerCourse(code, semester);

    if (res.isSuccess)
      emit(RegisteredCourse(oldState: oldState as Loaded));
    else
      emit(Failed(res.message ?? 'Error'));
  }

  // Admin
  attachCourse(int courseCode, String staffEmail) async {
    await CourseService.attachCourse(courseCode, staffEmail);
  }

  Future<bool> toggleCourseStatus(int courseCode) async {
    final res = await CourseService.toggleCourseStatus(courseCode);

    if (res.isSuccess) return true;
    return false;
  }
}
