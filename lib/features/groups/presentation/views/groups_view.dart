import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/services/get_it_service.dart';
import 'package:my_classes/features/groups/domain/repos/group_repo.dart';
import 'package:my_classes/features/groups/presentation/cubits/groups_cubit.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/groups_view_body_bloc_consumer.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});
  static const String routeName = '/groups';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupsCubit(getIt<GroupRepo>())..getGroups(),
      child: const Scaffold(body: GroupsViewBodyBlocConsumer()),
    );
  }
}
