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
}
