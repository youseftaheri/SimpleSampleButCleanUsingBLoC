import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:my_flutter_test_app1/data/network/network_request.dart';
import 'data/network/network_status.dart';
import 'data/repositories/abstract/login_repository.dart';
import 'data/repositories/abstract/user_list_repository.dart';
import 'data/repositories/login_repository_impl.dart';
import 'data/repositories/user_list_repository_impl.dart';
import 'domain/usecases/login_usecase.dart';
import 'package:http/http.dart' as http;

import 'domain/usecases/user_list_usecase.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));

  //Singleton for HTTP request
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton<NetworkRequestAbstract>(() => NetworkRequest(client: sl()),);

  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(),);
  sl.registerFactory<LoginUseCase>(() => LoginUseCaseImpl());

  sl.registerLazySingleton<UserListRepository>(() => UserListRepositoryImpl(),);
  sl.registerFactory<UserListUseCase>(() => UserListUseCaseImpl());
}
