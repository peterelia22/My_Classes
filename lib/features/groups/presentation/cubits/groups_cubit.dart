import 'package:bloc/bloc.dart';
import 'package:my_classes/core/utils/time_conflict_checker.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import 'package:my_classes/features/groups/domain/repos/group_repo.dart';
import 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit(this.groupRepo) : super(GroupsInitial());
  final GroupRepo groupRepo;

  List<GroupEntity> currentGroups = [];

  Future<void> getGroups() async {
    emit(GroupsLoading());
    final result = await groupRepo.getGroups();
    result.fold(
      (_) => emit(GroupsFailure(errorMessage: 'تعذر تحميل المجموعات')),
      (groups) {
        currentGroups = groups;
        emit(GroupsSuccess(groups: groups));
      },
    );
  }

  Future<void> addGroup(GroupEntity group) async {
    if (TimeConflictChecker.hasConflict(currentGroups, group)) {
      emit(GroupActionFailure(errorMessage: 'يوجد مجموعة أخرى في نفس الميعاد'));
      return;
    }
    emit(GroupsLoading());
    final result = await groupRepo.addGroup(group);
    result.fold(
      (_) => emit(GroupActionFailure(errorMessage: 'تعذر إضافة المجموعة')),
      (_) async {
        await getGroups();
        emit(GroupActionSuccess());
      },
    );
  }

  Future<void> updateGroup(GroupEntity group) async {
    final otherGroups = currentGroups.where((g) => g.id != group.id).toList();
    if (TimeConflictChecker.hasConflict(otherGroups, group)) {
      emit(GroupActionFailure(errorMessage: 'يوجد مجموعة أخرى في نفس الميعاد'));
      return;
    }
    emit(GroupsLoading());
    final result = await groupRepo.updateGroup(group);
    result.fold(
      (_) => emit(GroupActionFailure(errorMessage: 'تعذر تعديل المجموعة')),
      (_) async {
        await getGroups();
        emit(GroupActionSuccess());
      },
    );
  }

  Future<void> deleteGroup(String id) async {
    emit(GroupsLoading());
    final result = await groupRepo.deleteGroup(id);
    result.fold(
      (_) => emit(GroupActionFailure(errorMessage: 'تعذر حذف المجموعة')),
      (_) async {
        await getGroups();
        emit(GroupActionSuccess());
      },
    );
  }
}
