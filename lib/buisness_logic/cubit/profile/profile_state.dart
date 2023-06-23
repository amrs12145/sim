part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class Initial extends ProfileState {}

class Loading extends ProfileState {}

class Loaded extends ProfileState {
  final StudentInfo studentInfo;
  final List<Course> courses;
  Loaded(this.studentInfo, this.courses);
}

class Failed extends ProfileState {
  final String message;
  Failed(this.message);
}
