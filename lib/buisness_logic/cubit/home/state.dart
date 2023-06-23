part of 'cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  HomeLoaded(this.fields, this.courses, this.availableCourses);
  final List<Field> fields;
  final List<Course> courses;
  final List<Course> availableCourses;
}

class HomeCourses extends HomeState {
  HomeCourses(this.courses);
  final List<Course> courses;
}

class HomeLogOut extends HomeState {}

class HomeFailed extends HomeState {
  HomeFailed(this.message);
  final String? message;
}
