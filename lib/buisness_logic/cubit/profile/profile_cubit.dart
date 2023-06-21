import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/course.dart';
import '../../../data/net/profile.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(Initial());

  getRegisteredCourses() async {
    emit(Loading());
    final res = await ProfileService.loadRegisteredCourses();

    if (res.isSuccess) {
      emit(Loaded(res.dataModel!));
    } else {
      emit(Failed(res.message ?? 'Error'));
    }
  }
}
