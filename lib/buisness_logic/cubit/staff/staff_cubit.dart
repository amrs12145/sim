import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sim/data/net/staff.dart';

import '../../../data/models/course.dart';
import '../../../data/models/staff.dart';

part 'staff_state.dart';

class StaffCubit extends Cubit<StaffState> {
  StaffCubit() : super(Initial());

  getCourses(
    String email,
  ) async {
    emit(Loading());

    final res = await StaffService.loadCourseDetails(email);
    if (res.isSuccess) {
      emit(Loaded(res.dataModel!.courses!));
    } else {
      emit(Failed(res.message ?? 'Error'));
    }
  }
}
