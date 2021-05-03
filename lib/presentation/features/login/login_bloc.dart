import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_test_app1/data/repositories/abstract/login_repository.dart';
import 'package:my_flutter_test_app1/presentation/features/authentication/authentication_bloc.dart';

import 'login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.loginRepository,
    @required this.authenticationBloc,
  })  : assert(loginRepository != null),
        assert(authenticationBloc != null),
        super(LoginInitialState());
  @override
  Stream<LoginState> mapEventToState(
      LoginEvent event,
      ) async* {
    // normal sign in
    if (event is LoginPressed) {
      yield LoginProcessingState();
      try {
        var token = await loginRepository.getLoginResult(
          email: event.email,
          password: event.password,
        );
        authenticationBloc.add(LoggedIn(token));
        yield LoginFinishedState();
      } catch (error) {
        yield LoginErrorState(error);
      }
    }

  }
}