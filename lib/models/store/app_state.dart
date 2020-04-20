import 'package:authapp/models/api/login_response.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LoginResponse _loginResponse;

  AppState({loginResponse}) : this._loginResponse = loginResponse;

  AppState copyWith({
    authState,
  }) {
    return AppState(
      loginResponse: authState ?? this._loginResponse,
    );
  }

  LoginResponse get authState => _loginResponse;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          _loginResponse == other._loginResponse;

  @override
  int get hashCode => _loginResponse.hashCode;

  @override
  String toString() {
    return 'AppState{'
        '\n_authState: '
        '\n$_loginResponse}';
  }
}
