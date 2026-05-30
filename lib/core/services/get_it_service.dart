import 'package:get_it/get_it.dart';
import 'package:my_classes/core/network/network_info.dart';
import 'package:my_classes/core/services/isar_service.dart';
import 'package:my_classes/core/services/supbase_auth_service.dart';
import 'package:my_classes/core/services/supbase_database_service.dart';
import 'package:my_classes/features/auth/login/data/repos/auth_repo_impl.dart';
import 'package:my_classes/features/auth/login/domain/repos/auth_repo.dart';
import 'package:my_classes/features/groups/data/datasources/group_local_datasource.dart';
import 'package:my_classes/features/groups/data/datasources/group_remote_datasource.dart';
import 'package:my_classes/features/groups/data/repos/group_repo_impl.dart';
import 'package:my_classes/features/groups/domain/repos/group_repo.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Services
  final isarService = IsarService();
  await isarService.init();
  getIt.registerSingleton<IsarService>(isarService);
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());
  getIt.registerSingleton<SupabaseDatabaseService>(SupabaseDatabaseService());
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl());

  // Auth
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(supbaseauthService: getIt<SupabaseAuthService>()),
  );

  // Groups
  getIt.registerSingleton<GroupLocalDatasource>(
    GroupLocalDatasource(isarService: getIt<IsarService>()),
  );
  getIt.registerSingleton<GroupRemoteDatasource>(
    GroupRemoteDatasource(db: getIt<SupabaseDatabaseService>()),
  );
  getIt.registerSingleton<GroupRepo>(
    GroupRepoImpl(
      remote: getIt<GroupRemoteDatasource>(),
      local: getIt<GroupLocalDatasource>(),
      network: getIt<NetworkInfo>(),
    ),
  );
}
