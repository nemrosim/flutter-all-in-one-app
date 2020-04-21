import 'package:authapp/models/api/login_response.dart';

class LoginResponseAction {
  final LoginResponse _loginResponse;

  LoginResponseAction({loginResponse}) : this._loginResponse = loginResponse;

  LoginResponse get loginResponse => _loginResponse;

  @override
  String toString() {
    return 'LoginResponseAction{_loginResponse: $_loginResponse}';
  }
}
