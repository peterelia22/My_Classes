import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:my_classes/core/network/network_info.dart';
import 'package:my_classes/features/groups/domain/repos/group_repo.dart';

import '../../features/students/domain/repos/student_repo.dart';

class NetworkListenerService {
  final NetworkInfo networkInfo;
  final GroupRepo groupRepo;
  final StudentRepo studentRepo;

  NetworkListenerService({
    required this.networkInfo,
    required this.groupRepo,
    required this.studentRepo,
  });

  void startListening() {
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) async {
      if (results.isNotEmpty && !results.contains(ConnectivityResult.none)) {
        final hasInternet = await networkInfo.isConnected;

        if (hasInternet) {
          await groupRepo.syncUnsyncedGroups();
          await studentRepo.syncUnsyncedStudents();
        }
      }
    });
  }
}
