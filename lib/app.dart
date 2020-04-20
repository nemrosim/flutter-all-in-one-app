import 'package:authapp/models/store/app_state.dart';
import 'package:authapp/routes/auth_route.dart';
import 'package:authapp/routes/main_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> _store;
  final WidgetBuilder _devDrawerBuilder;

  App({
    Key key,
    @required store,
    devDrawerBuilder,
  })  : this._store = store,
        this._devDrawerBuilder = devDrawerBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: Home(
          endDrawer:
              _devDrawerBuilder != null ? _devDrawerBuilder(context) : null,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final Widget endDrawer;

  Home({this.endDrawer});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, String>(
        converter: (store) => store.state.authState.token,
        builder: (BuildContext context, token) {
          print('STORE $token');
          return Scaffold(
            endDrawer: endDrawer,
            appBar: AppBar(
              title: Text(token == null ? 'Login form' : 'Main content'),
              backgroundColor: Colors.blueGrey,
            ),
            body: token == null ? AuthRoute() : MainRoute(),
          );
        });
  }
}
