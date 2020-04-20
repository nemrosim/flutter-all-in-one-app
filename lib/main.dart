import 'package:authapp/models/api/login_response.dart';
import 'package:authapp/models/store/app_state.dart';
import 'package:authapp/store/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:redux/redux.dart';

import 'app.dart';

Future main() async {
  await DotEnv().load('.env.development');

  runApp(App(
    store: Store<AppState>(
      appReducer,
      initialState: AppState(
        loginResponse: LoginResponse(
          token: null,
          refreshToken: null,
        ),
      ),
    ),
  ));
}
