import 'package:flutter/material.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/features/groups/domain/entities/group_entity.dart';
import 'group_card.dart';

class GroupsViewBody extends StatelessWidget {
  final List<GroupEntity> groups;
  const GroupsViewBody({super.key, required this.groups});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (groups.isEmpty)
              Expanded(
                child: Center(
                  child: Text(
                    'لا توجد مجموعات بعد',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ),
              )
            else
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount: groups.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) => GroupCard(group: groups[index]),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
