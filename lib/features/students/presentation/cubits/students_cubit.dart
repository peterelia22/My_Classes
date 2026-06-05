import 'package:bloc/bloc.dart';
import '../../domain/entities/student_entity.dart';
import '../../domain/repos/student_repo.dart';
part 'students_state.dart';

class StudentsCubit extends Cubit<StudentsState> {
  StudentsCubit(this.studentRepo) : super(StudentsInitial());
  final StudentRepo studentRepo;

  List<StudentEntity> currentStudents = [];
  String? currentGroupId;

  Future<void> getStudents(String groupId) async {
    currentGroupId = groupId;
    emit(StudentsLoading());
    final result = await studentRepo.getStudentsByGroup(groupId);
    result.fold((f) => emit(StudentsFailure(errorMessage: f.message)), (
      students,
    ) {
      currentStudents = students;
      emit(StudentsSuccess(students: students));
    });
  }

  Future<void> addStudent({
    required StudentEntity student,
    required String password,
  }) async {
    emit(StudentsLoading());
    final result = await studentRepo.addStudent(
      student: student,
      password: password,
    );
    result.fold((f) => emit(StudentActionFailure(errorMessage: f.message)), (
      _,
    ) async {
      await getStudents(student.groupId);
      emit(StudentActionSuccess());
    });
  }

  Future<void> updateStudent(StudentEntity student) async {
    emit(StudentsLoading());
    final result = await studentRepo.updateStudent(student);
    result.fold((f) => emit(StudentActionFailure(errorMessage: f.message)), (
      _,
    ) async {
      await getStudents(currentGroupId!);
      emit(StudentActionSuccess());
    });
  }

  Future<void> deleteStudent(String id) async {
    emit(StudentsLoading());
    final result = await studentRepo.deleteStudent(id);
    result.fold((f) => emit(StudentActionFailure(errorMessage: f.message)), (
      _,
    ) async {
      await getStudents(currentGroupId!);
      emit(StudentDeleteSuccess());
    });
  }
}
