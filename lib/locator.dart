import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'data/network/network_status.dart';
import 'data/repositories/abstract/login_repository.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

//Service locator description
void init() {
  //Singleton for NetworkStatus identification
  sl.registerLazySingleton<NetworkStatus>(() => NetworkStatusImpl(DataConnectionChecker()));


  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(),);
  //get rate login info by filter use case
  sl.registerFactory<LoginUseCase>(() => LoginUseCaseImpl());
}
