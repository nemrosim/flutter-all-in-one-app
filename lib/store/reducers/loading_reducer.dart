import 'package:authapp/models/api/login_response.dart';
import 'package:authapp/store/actions/actions.dart';
import 'package:redux/redux.dart';

final loginReducer = combineReducers<LoginResponse>([
  TypedReducer<LoginResponse, LoginResponseAction>(_setLoginResponseData),
]);

LoginResponse _setLoginResponseData(
    LoginResponse state, LoginResponseAction action) {
  return LoginResponse(
    token: action.loginResponse.token,
    refreshToken: action.loginResponse.refreshToken,
  );
}
