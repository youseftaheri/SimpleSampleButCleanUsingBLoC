import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_test_app1/data/repositories/abstract/login_repository.dart';
import 'package:my_flutter_test_app1/domain/usecases/login_usecase.dart';
import 'package:my_flutter_test_app1/presentation/features/authentication/authentication_bloc.dart';
import 'package:my_flutter_test_app1/presentation/features/authentication/authentication_event.dart';

import '../../../locator.dart';
import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  AuthenticationBloc authenticationBloc;

  LoginBloc() : loginUseCase = sl(), super(null);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginLoadEvent) {
      yield state;
    } else
    if (event is LoginPressed) {
      yield LoginProcessingState();
      try {
        LoginResult loginResult = await loginUseCase.execute(LoginParams(
            email: event.email,
            password: event.password));
        if(loginResult.login.token != null) {
          // authenticationBloc.add(LoggedIn(loginResult.login.token));
          yield LoginErrorState(loginResult.login.token);
        }else
          yield LoginErrorState(loginResult.login.error);
        // yield LoginFinishedState();
      } catch (error) {
        yield LoginErrorState(error.toString());
      }

    }
  }
}
//   class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final LoginRepository loginRepository;
//   final AuthenticationBloc authenticationBloc;
//
//   LoginBloc({
//     @required this.loginRepository,
//     @required this.authenticationBloc,
//   })  : assert(loginRepository != null),
//         assert(authenticationBloc != null),
//         super(LoginInitialState());
//   @override
//   Stream<LoginState> mapEventToState(
//       LoginEvent event,
//       ) async* {
//     if (event is LoginLoadEvent) {
//         yield state;
//     } else
//     if (event is LoginPressed) {
//       yield LoginProcessingState();
//       try {
//         var token = await loginRepository.getLoginResult(
//           email: event.email,
//           password: event.password,
//         );
//         authenticationBloc.add(LoggedIn(token.token));
//         yield LoginFinishedState();
//       } catch (error) {
//         yield LoginErrorState(error.toString());
//       }
//     }
//
//   }
// }