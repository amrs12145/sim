// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/course.dart';
import '../../../data/models/field.dart';
import '../../../data/models/staff.dart';
import '../../../data/net/admin.dart';

part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  loadAll() async {
    emit(AdminLoading());

    final professors = await AdminService.loadProfessors();
    final fields = await AdminService.loadFields();
    final courses = await AdminService.loadCourses();

    if (fields.isSuccess && courses.isSuccess && professors.isSuccess) {
      emit(AdminLoaded(
          professors.dataModel!, fields.dataModel!, courses.dataModel!));
    } else
      emit(AdminFailed(
          '${professors.message}' '${fields.message}' '${courses.message}'));
  }

  // getFieldCourses(String fieldName) async {
  //   emit(AdminLoading());
  //   final res = await AdminService.loadFieldCourses(fieldName);

  //   if (res.isSuccess)
  //     emit(AdminCourses(res.dataModel!));
  //   else
  //     emit(AdminFailed(res.message));
  // }
}
