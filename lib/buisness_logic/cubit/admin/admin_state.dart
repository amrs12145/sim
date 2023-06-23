part of 'admin_cubit.dart';

abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminLoaded extends AdminState {
  AdminLoaded(this.professors, this.fields, this.courses);
  final List<Staff> professors;
  final List<Field> fields;
  final List<Course> courses;
}

class AdminCourses extends AdminState {
  AdminCourses(this.courses);
  final List<Course> courses;
}

class AdminLogOut extends AdminState {}

class AdminFailed extends AdminState {
  AdminFailed(this.message);
  final String? message;
}
