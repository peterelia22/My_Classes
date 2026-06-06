import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_classes/core/theme/app_colors.dart';
import 'package:my_classes/features/groups/presentation/views/groups_view.dart';
import 'package:my_classes/features/groups/presentation/views/widgets/group_bottom_sheet.dart';
import 'package:my_classes/features/home/presentation/views/home_layout.dart';
import 'package:my_classes/features/home/presentation/views/widgets/custom_navigation_bar.dart';
import 'package:my_classes/features/students/presentation/views/students_view.dart';
import '../../../../core/services/get_it_service.dart';
import '../../../groups/domain/repos/group_repo.dart';
import '../../../groups/presentation/cubits/groups_cubit.dart';
import '../../../students/domain/repos/student_repo.dart';
import '../../../students/presentation/cubits/students_cubit.dart';
import 'widgets/app_shell_fab.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});
  static const String routeName = '/home';

  @override
  State<AppShell> createState() => AppShellState();
}

class AppShellState extends State<AppShell> {
  int currentIndex = 0;
  late final PageController pageController;

  final List<Widget> screens = const [
    HomeLayout(),
    GroupsView(),
    StudentsView(),
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GroupsCubit(getIt<GroupRepo>())..getGroups(),
        ),
        BlocProvider(
          create: (_) => StudentsCubit(getIt<StudentRepo>())..getAllStudents(),
        ),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          extendBody: true,
          floatingActionButton: currentIndex == 1 || currentIndex == 2
              ? AppShellFab(currentIndex: currentIndex)
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() => currentIndex = index);
            },
            children: screens,
          ),
          bottomNavigationBar: CustomNavigationBar(
            selectedIndex: currentIndex,
            onDestinationSelected: (index) {
              setState(() => currentIndex = index);
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}
