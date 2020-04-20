import 'package:authapp/app.dart';
import 'package:authapp/models/api/login_response.dart';
import 'package:authapp/models/store/app_state.dart';
import 'package:authapp/store/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

// The Dev version of your app. It will build a DevToolsStore instead of a
// normal Store. In addition, it will provide a DevDrawer for the app, which
// will contain the ReduxDevTools themselves.
Future main() async {
  await DotEnv().load('.env.development');

  final store = DevToolsStore<AppState>(
    appReducer,
    initialState: AppState(
      loginResponse: LoginResponse(
        token: null,
        refreshToken: null,
      ),
    ),
  );

  runApp(ReduxDevToolsContainer(
    store: store,
    child: App(
      store: store,
      devDrawerBuilder: (context) {
        return Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: ReduxDevTools(store),
          ),
        );
      },
    ),
  ));
}
