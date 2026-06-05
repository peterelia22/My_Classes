part of 'students_cubit.dart';

sealed class StudentsState {}

final class StudentsInitial extends StudentsState {}

final class StudentsLoading extends StudentsState {}

final class StudentsSuccess extends StudentsState {
  final List<StudentEntity> students;
  StudentsSuccess({required this.students});
}

final class StudentsFailure extends StudentsState {
  final String errorMessage;
  StudentsFailure({required this.errorMessage});

  @override
  String toString() => 'StudentsFailure(errorMessage: $errorMessage)';
}

final class StudentActionSuccess extends StudentsState {}

final class StudentDeleteSuccess extends StudentsState {}

final class StudentActionFailure extends StudentsState {
  final String errorMessage;
  StudentActionFailure({required this.errorMessage});

  @override
  String toString() => 'StudentActionFailure(errorMessage: $errorMessage)';
}
