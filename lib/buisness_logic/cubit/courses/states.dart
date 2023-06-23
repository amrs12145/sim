part of 'cubit.dart';

@immutable
abstract class CoursesState {}

class Initial extends CoursesState {}

class Loading extends CoursesState {}

class CoursesLoaded extends CoursesState {
  CoursesLoaded(this.courses);
  final List<Course> courses;
}

class Failed extends CoursesState {
  Failed(this.message);
  final String? message;
}
