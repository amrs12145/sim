// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/course.dart';
import '../../../data/models/student_info.dart';
import '../../../data/net/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(Initial());

  loadAll() async {
    emit(Loading());

    final courses = await ProfileService.loadRegisteredCourses();
    final info = await ProfileService.loadStudentInfo();

    if (courses.isSuccess && info.isSuccess)
      emit(Loaded(info.dataModel!, courses.dataModel!));
    else
      emit(Failed('${courses.message}' '${info.message}'));
  }
}
