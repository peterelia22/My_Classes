import 'package:get_it/get_it.dart';
import 'package:my_classes/core/services/supbase_auth_service.dart';
import 'package:my_classes/features/auth/login/data/repos/auth_repo_impl.dart';
import 'package:my_classes/features/auth/login/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;
void setupGetit() {
  getIt.registerSingleton<SupabaseAuthService>(SupabaseAuthService());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(supbaseauthService: getIt<SupabaseAuthService>()),
  );
}
