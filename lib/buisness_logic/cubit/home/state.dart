part of 'cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFields extends HomeState {
  HomeFields(this.fields);
  final List<Field> fields;
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
