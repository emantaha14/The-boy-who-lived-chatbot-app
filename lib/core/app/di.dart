import 'package:get_it/get_it.dart';
import 'package:harry_potter_chat_bot/features/all_chats/data/datasource/chats_datasource.dart';
import 'package:harry_potter_chat_bot/features/all_chats/data/repo_impl/chats_repo_impl.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/repository/chats_repo.dart';
import 'package:harry_potter_chat_bot/features/all_chats/domain/usecase/chats_usecase.dart';
import 'package:harry_potter_chat_bot/features/login/data/datasources/login_datasource.dart';
import 'package:harry_potter_chat_bot/features/login/data/repo_impl/login_repo_impl.dart';
import 'package:harry_potter_chat_bot/features/login/domain/repository/login_repo.dart';
import 'package:harry_potter_chat_bot/features/login/domain/usecase/login_usecase.dart';
import 'package:harry_potter_chat_bot/features/signup/data/datasources/signup_datasource.dart';
import 'package:harry_potter_chat_bot/features/signup/data/repo_impl/signup_repo_impl.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/repository/signup_repo.dart';
import 'package:harry_potter_chat_bot/features/signup/domain/usecase/signup_usecase.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../network/network_info.dart';
import 'app_prefs.dart';

final sl = GetIt.instance;

Future<void> init() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<AppPrefs>(
        () => AppPrefs(sl()),
  );

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton(
    () => LoginUseCase(loginRepo: sl()),
  );
  sl.registerLazySingleton<LoginRepo>(
    () => LoginRepoImpl(loginDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<LoginDataSource>(
    () => LoginDataSourceImpl(),
  );


  sl.registerLazySingleton(
        () => SignupUseCase(signupRepo: sl()),
  );
  sl.registerLazySingleton<SignupRepo>(
        () => SignupRepoImpl(signupDatasource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<SignupDatasource>(
        () => SignupDataSourceImpl(),
  );

  sl.registerLazySingleton(
        () => ChatsUseCase(chatsRepo: sl()),
  );
  sl.registerLazySingleton<ChatsRepo>(
        () => ChatsRepoImpl(chatsDataSource: sl(), networkInfo: sl()),
  );
  sl.registerLazySingleton<ChatsDataSource>(
        () => ChatsDataSourceImpl(),
  );
}
