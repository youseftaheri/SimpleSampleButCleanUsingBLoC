class ServerAddresses {
  //Server address of your project should go here
  static const serverAddress = 'https://reqres.in/api/';

  static const _login = 'login/';
  static const _users = 'splash/';
  static const _details = 'app/login/';

  static String get login => serverAddress  + _login;
  static String get users => serverAddress  + _users;
  static String get details => serverAddress  + _details;
}
