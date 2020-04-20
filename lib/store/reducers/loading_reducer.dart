import 'package:authapp/models/api/login_response.dart';
import 'package:authapp/store/actions/actions.dart';
import 'package:redux/redux.dart';

final loadingReducer = combineReducers<LoginResponse>([
  TypedReducer<LoginResponse, LoginResponseAction>(_setLoginResponseData),
]);

LoginResponse _setLoginResponseData(dynamic state, action) {
  print(' ======== _setLoaded ==========');
  print(' state $state');
  print(' action: $action');

  return LoginResponse(token: 'token', refreshToken: 'refresh');
}
