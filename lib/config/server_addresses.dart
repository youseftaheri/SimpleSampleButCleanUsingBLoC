class ServerAddresses {
  static const serverAddress = 'https://reqres.in/api/';

  static const _login = 'login/';
  static const _users = 'users';
  static const _details = 'users/';

  static String get login => serverAddress  + _login;
  static String get users => serverAddress  + _users;
  static String get details => serverAddress  + _details;
}
