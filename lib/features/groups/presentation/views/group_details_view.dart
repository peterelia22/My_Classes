import 'package:flutter/material.dart';

import '../../domain/entities/group_entity.dart';
import 'widgets/group_details_view_bloc_consumer.dart';

class GroupDetailsView extends StatelessWidget {
  static const String routeName = '/group-details';
  final GroupEntity group;
  const GroupDetailsView({super.key, required this.group});
  @override
  Widget build(BuildContext context) {
    return GroupDetailsViewBlocConsumer(group: group);
  }
}
