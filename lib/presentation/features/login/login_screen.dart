import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_test_app1/config/routes.dart';
import 'package:my_flutter_test_app1/config/theme.dart';
import 'package:my_flutter_test_app1/domain/entities/validator.dart';
import 'package:my_flutter_test_app1/presentation/widgets/independent/block_header.dart';
import 'package:my_flutter_test_app1/presentation/widgets/independent/custom_button.dart';
import 'package:my_flutter_test_app1/presentation/widgets/independent/input_field.dart';
import 'package:my_flutter_test_app1/utils/constants/strings.dart';

import 'login.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  // @override
  // State<StatefulWidget> createState() {
  //   return _LoginScreenState();
  // }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<MyInputFieldState> emailKey = GlobalKey();
  final GlobalKey<MyInputFieldState> passwordKey = GlobalKey();

  double sizeBetween;

  @override
  Widget build(BuildContext context1) {
    var height = MediaQuery.of(context1).size.height;
    var width = MediaQuery.of(context1).size.width;
    sizeBetween = height / 20;
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.transparent,
          brightness: Brightness.light,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.colorPrimary),
        ),
        backgroundColor: AppColors.background,
        body:

    //     BlocProvider<LoginBloc>(
    // create: (context) {
    // return LoginBloc()
    // ..add(LoginLoadEvent());
    // },
    // child:

        // Builder(
        //   // Here the magic happens
        //   // this builder function will generate a new BuilContext for you
        //     builder: (BuildContext context){
        //       return
        //       BlocBuilder<LoginBloc, LoginState>(
        //       builder: (BuildContext context, LoginState state) {
                BlocConsumer<LoginBloc, LoginState>(
                  listener: (context, state) {
                    // on success delete navigator stack and push to home
                    if (state is LoginFinishedState) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        TestAppRoutes.users, (Route<dynamic> route) => false,
                      );
                    }
                    if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${state.error}'),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    // show loading screen while processing
                    if (state is LoginProcessingState) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SingleChildScrollView(
                      child: Container(
                        height: height * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyBlockHeader(title: Strings.login, width: width),
                            SizedBox(
                              height: sizeBetween,
                            ),
                            MyInputField(
                              key: emailKey,
                              controller: emailController,
                              hint: Strings.email,
                              validator: Validator.validateEmail,
                              keyboard: TextInputType.emailAddress,
                            ),
                            MyInputField(
                              key: passwordKey,
                              controller: passwordController,
                              hint: Strings.password,
                              validator: Validator.passwordCorrect,
                              keyboard: TextInputType.visiblePassword,
                              isPassword: true,
                            ),
                            // MyRightArrow(
                            //   Strings.forgot_your_password,
                            //   onClick: _showForgotPassword,
                            // ),
                            MyButton(
                                title: Strings.login, onPressed: _validateAndSend),
                            SizedBox(
                              height: sizeBetween * 2,
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: AppSizes.linePadding),
                            //   child: Center(
                            //     child: Text(Strings.or_sign_up_with_social_account),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //     children: <Widget>[
                            //       MyServiceButton(
                            //         serviceType: ServiceType.Google,
                            //         onPressed: () {
                            //           BlocProvider.of<SignUpBloc>(context).add(
                            //             SignUpPressedGoogle(),
                            //           );
                            //         },
                            //       ),
                            //       MyServiceButton(
                            //         serviceType: ServiceType.Facebook,
                            //         onPressed: () {
                            //           BlocProvider.of<SignUpBloc>(context).add(
                            //             SignUpPressedFacebook(),
                            //           );
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
                )
            // }
        // )

    );
  }

  void _validateAndSend() {
    // if (emailKey.currentState.validate() != null) {
    //   return;
    // }
    // if (passwordKey.currentState.validate() != null) {
    //   return;
    // }
    BlocProvider.of<LoginBloc>(context).add(
      LoginPressed(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }
}
