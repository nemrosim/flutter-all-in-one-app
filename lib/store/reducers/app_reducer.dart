import 'package:authapp/models/store/app_state.dart';
import 'package:authapp/store/reducers/loading_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    loginResponse: loadingReducer(state.authState, action),
  );
}
