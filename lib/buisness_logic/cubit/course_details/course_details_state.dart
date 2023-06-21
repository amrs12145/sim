part of 'course_details_cubit.dart';

@immutable
abstract class CourseDetailsState {}

class Initial extends CourseDetailsState {}

class Loading extends CourseDetailsState {}

class Loaded extends CourseDetailsState {
  final CourseDetails courseDetails;
  Loaded(this.courseDetails);
}

class Failed extends CourseDetailsState {
  final String message;
  Failed(this.message);
}
