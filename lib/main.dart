import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:my_flutter_test_app1/config/theme.dart';
import 'package:my_flutter_test_app1/presentation/features/login/login.dart';
import 'package:my_flutter_test_app1/presentation/features/login/login_screen.dart';

import 'config/routes.dart';
import 'config/routes.dart';
import 'config/theme.dart';
import 'data/repositories/abstract/login_repository.dart';
import 'data/repositories/abstract/login_repository.dart';
import 'locator.dart';
import 'presentation/features/authentication/authentication.dart';

import 'locator.dart' as service_locator;
import 'presentation/features/login/login_screen.dart';
import 'presentation/features/login/login_screen.dart';


// class SimpleBlocDelegate extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }
//
//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }
//
//   @override
//   void onError(Cubit bloc, Object error, StackTrace stacktrace) {
//     super.onError(bloc, error, stacktrace);
//     print(error);
//   }
// }
//
// void main() async {
//   await service_locator.init();
//
//   var delegate = await LocalizationDelegate.create(
//     fallbackLocale: 'en_US',
//     supportedLocales: ['en_US', 'de', 'fr'],
//   );
//
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   Bloc.observer = SimpleBlocDelegate();
//   runApp(
//     BlocProvider<AuthenticationBloc>(
//       create: (context) => AuthenticationBloc()..add(AppStarted()),
//       child:
//       MultiRepositoryProvider(
//         providers: [
//           RepositoryProvider<LoginRepository>(
//             create: (context) => sl(),
//           ),
//           // RepositoryProvider<ProductRepository>(
//           //   create: (context) => sl(),
//           // ),
//           // RepositoryProvider<FavoritesRepository>(
//           //   create: (context) => sl(),
//           // ),
//           // RepositoryProvider<UserRepository>(
//           //   create: (context) => sl(),
//           // ),
//           // RepositoryProvider<CartRepository>(
//           //   create: (context) => sl(),
//           // ),
//         ],
//         child: LocalizedApp(
//           delegate,
//           OpenFlutterEcommerceApp(),
//         ),
//       ),
//     ),
//   );
// }
//
// class OpenFlutterEcommerceApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var localizationDelegate = LocalizedApp.of(context).delegate;
//
//     return LocalizationProvider(
//         state: LocalizationProvider.of(context).state,
//         child: MaterialApp(
//           localizationsDelegates: [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             localizationDelegate,
//           ],
//           onGenerateRoute: _registerRoutesWithParameters,
//           supportedLocales: localizationDelegate.supportedLocales,
//           debugShowCheckedModeBanner: false,
//           locale: localizationDelegate.currentLocale,
//           title: 'Open FLutter E-commerce',
//           theme: MyAppTheme.of(context),
//           routes: _registerRoutes(),
//         ));
//   }
//
//   Map<String, WidgetBuilder> _registerRoutes() {
//     return <String, WidgetBuilder>{
//       TestAppRoutes.login: (context) => LoginScreen(),
//     };
//   }
//
//   Route _registerRoutesWithParameters(RouteSettings settings) {
//       return MaterialPageRoute(
//         builder: (context) {
//           return LoginScreen();
//         },
//       );
//   }
// }
class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

void main() async {
  await service_locator.init();

  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en_US',
    supportedLocales: ['en_US', 'de'],
  );

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = SimpleBlocDelegate();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc()..add(AppStarted()),
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<LoginRepository>(
            create: (context) => sl(),
          ),
          // RepositoryProvider<ProductRepository>(
          //   create: (context) => sl(),
          // ),
        ],
        child: LocalizedApp(
          delegate,
          TestAppApp(),
        ),
      ),
    ),
  );
}

class TestAppApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var localizationDelegate = LocalizedApp.of(context).delegate;

    return LocalizationProvider(
        state: LocalizationProvider.of(context).state,
        child: MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            localizationDelegate,
          ],
          onGenerateRoute: _registerRoutesWithParameters,
          supportedLocales: localizationDelegate.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: localizationDelegate.currentLocale,
          title: 'My Test App',
          theme: MyAppTheme.of(context),
          routes: _registerRoutes(),
        ));
  }

  Map<String, WidgetBuilder> _registerRoutes() {
    return <String, WidgetBuilder>{
      TestAppRoutes.login: (context) => _buildLoginBloc(),
      // TestAppRoutes.users: (context) => UsersScreen(),
      // TestAppRoutes.details: (context) => DetailsScreen(),
      // TestAppRoutes.profile: (context) =>
      //     BlocBuilder<AuthenticationBloc, AuthenticationState>(
      //         builder: (context, state) {
      //           //TODO: revise authentication later. Right now no login is required.
      //           /*if (state is Authenticated) {
      //         return ProfileScreen(); //TODO profile properties should be here
      //       } else if (state is Unauthenticated) {
      //         return _buildSignInBloc();
      //       } else {
      //         return SplashScreen();
      //       }*/
      //           return ProfileScreen();
      //         }),
    };
  }

  BlocProvider<LoginBloc> _buildLoginBloc() {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(
        // loginRepository: RepositoryProvider.of<LoginRepository>(context),
        // authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
      ),
      child: LoginScreen(),
    );
  }

  // BlocProvider<SignInBloc> _buildSignInBloc() {
  //   return BlocProvider<SignInBloc>(
  //     create: (context) => SignInBloc(
  //       userRepository: RepositoryProvider.of<UserRepository>(context),
  //       authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
  //     ),
  //     child: SignInScreen(),
  //   );
  // }
  //
  // BlocProvider<SignUpBloc> _buildSignUpBloc() {
  //   return BlocProvider<SignUpBloc>(
  //     create: (context) => SignUpBloc(
  //       userRepository: RepositoryProvider.of<UserRepository>(context),
  //       authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
  //     ),
  //     child: SignUpScreen(),
  //   );
  // }

  Route _registerRoutesWithParameters(RouteSettings settings) {
    // if (settings.name == TestAppRoutes.shop) {
    //   final CategoriesParameters args = settings.arguments;
    //   return MaterialPageRoute(
    //     builder: (context) {
    //       return CategoriesScreen(
    //         parameters: args,
    //       );
    //     },
    //   );
    // } else if (settings.name == TestAppRoutes.productList) {
    //   final ProductListScreenParameters productListScreenParameters =
    //       settings.arguments;
    //   return MaterialPageRoute(builder: (context) {
    //     return ProductsScreen(
    //       parameters: productListScreenParameters,
    //     );
    //   });
    // } else if (settings.name == TestAppRoutes.product) {
    //   final ProductDetailsParameters parameters = settings.arguments;
    //   return MaterialPageRoute(builder: (context) {
    //     return ProductDetailsScreen(parameters);
    //   });
    // } else if (settings.name == TestAppRoutes.filters) {
    //   final FilterRules filterRules = settings.arguments;
    //   return MaterialPageRoute(builder: (context) {
    //     return FiltersScreen(filterRules);
    //   });
    // } else {
      return MaterialPageRoute(
        builder: (context) {
          return LoginScreen();
        },
      );
    // }
  }
}
