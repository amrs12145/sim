part of 'staff_cubit.dart';

@immutable
abstract class StaffState {}

class Initial extends StaffState {}

class Loading extends StaffState {}

class Loaded extends StaffState {
  final List<Course> courses;
  Loaded(this.courses);
}

class Failed extends StaffState {
  final String message;
  Failed(this.message);
}
