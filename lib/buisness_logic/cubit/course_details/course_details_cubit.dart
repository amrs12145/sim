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
}
