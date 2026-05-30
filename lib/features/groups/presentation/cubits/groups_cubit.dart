import 'package:bloc/bloc.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import 'package:my_classes/features/groups/domain/repos/group_repo.dart';
import 'groups_state.dart';

class GroupsCubit extends Cubit<GroupsState> {
  GroupsCubit(this.groupRepo) : super(GroupsInitial());
  final GroupRepo groupRepo;

  Future<void> getGroups() async {
    emit(GroupsLoading());
    final result = await groupRepo.getGroups();
    result.fold(
      (failure) => emit(GroupsFailure(errorMessage: failure.message)),
      (groups) => emit(GroupsSuccess(groups: groups)),
    );
  }

  Future<void> addGroup(GroupEntity group) async {
    emit(GroupsLoading());
    final result = await groupRepo.addGroup(group);
    result.fold(
      (failure) => emit(GroupActionFailure(errorMessage: failure.message)),
      (_) => getGroups(),
    );
  }

  Future<void> updateGroup(GroupEntity group) async {
    emit(GroupsLoading());
    final result = await groupRepo.updateGroup(group);
    result.fold(
      (failure) => emit(GroupActionFailure(errorMessage: failure.message)),
      (_) => getGroups(),
    );
  }

  Future<void> deleteGroup(String id) async {
    emit(GroupsLoading());
    final result = await groupRepo.deleteGroup(id);
    result.fold(
      (failure) => emit(GroupActionFailure(errorMessage: failure.message)),
      (_) => getGroups(),
    );
  }
}
