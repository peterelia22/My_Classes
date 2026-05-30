import 'package:get_it/get_it.dart';
import 'package:my_classes/core/services/isar_service.dart';
import 'package:my_classes/core/services/supbase_auth_service.dart';
import 'package:my_classes/core/services/supbase_database_service.dart';
import 'package:my_classes/features/auth/login/data/repos/auth_repo_impl.dart';
import 'package:my_classes/features/auth/login/domain/repos/auth_repo.dart';
import 'package:my_classes/features/groups/data/datasources/group_remote_datasource.dart';

import '../../features/groups/data/datasources/group_local_datasource.dart';

final getIt = GetIt.instance;
void setupGetit() async {
  final isarService = IsarService();
  await isarService.init();
  getIt.registerSingleton<IsarService>(isarService);
  getIt.registerSingleton<SupabaseDatabaseService>(SupabaseDatabaseService());

  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(supbaseauthService: getIt<SupabaseAuthService>()),
  );
  getIt.registerSingleton<GroupLocalDatasource>(
    GroupLocalDatasource(isarService: getIt<IsarService>()),
  );
  getIt.registerSingleton<GroupRemoteDatasource>(
    GroupRemoteDatasource(db: getIt<SupabaseDatabaseService>()),
  );
}
