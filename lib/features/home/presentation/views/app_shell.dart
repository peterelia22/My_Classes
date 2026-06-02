import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/core/theme/app_text_styles.dart';
import 'package:my_classes/features/groups/presentation/views/groups_view.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/add_group_bottom_sheet.dart';
import 'package:my_classes/features/home/presentation/views/home_layout.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../groups/domain/repos/group_repo.dart';
import '../../../groups/presentation/cubits/groups_cubit.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  static const String routeName = '/home';

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int currentIndex = 0;
  late final PageController pageController;

  final List<Widget> _screens = const [
    HomeLayout(),
    GroupsView(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupsCubit(getIt<GroupRepo>())..getGroups(),
      child: Builder(
        builder: (context) => Scaffold(
          extendBody: true,
          floatingActionButton: currentIndex == 1
              ? FloatingActionButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => BlocProvider.value(
                        value: context.read<GroupsCubit>(),
                        child: const AddGroupBottomSheet(),
                      ),
                    );
                  },
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(Icons.add, color: Colors.white),
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: _screens,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.surfaceColor,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadowColor,
                    blurRadius: 24,
                    offset: const Offset(0, -8),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    backgroundColor: Colors.transparent,
                    indicatorColor: AppColors.primaryColor.withOpacity(0.12),
                    elevation: 0,
                    labelTextStyle:
                        MaterialStateProperty.resolveWith<TextStyle?>((states) {
                      final bool selected = states.contains(
                        MaterialState.selected,
                      );
                      return (selected
                              ? AppTextStyles.labelMedium
                              : AppTextStyles.labelSmall)
                          .copyWith(
                        color: selected
                            ? AppColors.primaryColor
                            : AppColors.textSecondaryColor,
                      );
                    }),
                    iconTheme:
                        MaterialStateProperty.resolveWith<IconThemeData?>((
                      states,
                    ) {
                      final bool selected = states.contains(
                        MaterialState.selected,
                      );
                      return IconThemeData(
                        color: selected
                            ? AppColors.primaryColor
                            : AppColors.textSecondaryColor,
                        size: selected ? 26 : 24,
                      );
                    }),
                  ),
                  child: NavigationBar(
                    selectedIndex: currentIndex,
                    height: 72,
                    onDestinationSelected: (index) {
                      setState(() => currentIndex = index);
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    destinations: const [
                      NavigationDestination(
                        icon: Icon(Icons.home_outlined),
                        selectedIcon: Icon(Icons.home),
                        label: 'الرئيسية',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.groups_outlined),
                        selectedIcon: Icon(Icons.groups),
                        label: 'المجموعات',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.people_outlined),
                        selectedIcon: Icon(Icons.people),
                        label: 'الطلاب',
                      ),
                      NavigationDestination(
                        icon: Icon(Icons.payment_outlined),
                        selectedIcon: Icon(Icons.payment),
                        label: 'المدفوعات',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
