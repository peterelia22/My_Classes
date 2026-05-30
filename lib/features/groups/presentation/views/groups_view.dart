import 'package:flutter/material.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/group_view_body.dart';

class GroupsView extends StatelessWidget {
  const GroupsView({super.key});
  static const String routeName = '/groups';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GroupViewBody());
  }
}
