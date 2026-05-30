import 'package:my_classes/features/groups/domain/entities/group_entity.dart';

sealed class GroupsState {}

final class GroupsInitial extends GroupsState {}

final class GroupsLoading extends GroupsState {}

final class GroupsSuccess extends GroupsState {
  final List<GroupEntity> groups;
  GroupsSuccess({required this.groups});
}

final class GroupsFailure extends GroupsState {
  final String errorMessage;
  GroupsFailure({required this.errorMessage});
}

final class GroupActionSuccess extends GroupsState {}

final class GroupActionFailure extends GroupsState {
  final String errorMessage;
  GroupActionFailure({required this.errorMessage});
}
