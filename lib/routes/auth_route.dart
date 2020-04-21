import 'dart:convert';

import 'package:authapp/constants/config.dart';
import 'package:authapp/models/api/login_response.dart';
import 'package:authapp/models/store/app_state.dart';
import 'package:authapp/store/actions/actions.dart';
import 'package:authapp/widgets/os_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:sentry/sentry.dart';

import 'package:http/http.dart' as http;

typedef OnLoginResponseCallback = void Function(LoginResponse loginResponse);

final SentryClient sentry =
    new SentryClient(dsn: DotEnv().env['SENTRY_IO_DSN_KEY']);

class AuthRoute extends StatefulWidget {
  @override
  _AuthRouteState createState() => _AuthRouteState();
}

class _AuthRouteState extends State<AuthRoute> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;
  bool isLoading = false;
  bool isFetchSuccess = false;
  String _baseUrl = DotEnv().env['BASE_URL'];

  Future<void> _showErrorDialog(String errorMessage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return OSAlertDialog(
          errorMessage: errorMessage,
        );
      },
    );
  }

  _loginHandler(OnLoginResponseCallback loginResponseCallback) async {
    if (AppConfig.showSentryInfo) {
      await sentry.capture(
        event: Event(
            level: SeverityLevel.info,
            message: "custom",
            extra: {'email': _email}),
      );
    }

    setState(() {
      isLoading = true;
    });

    final http.Response response = await http.post('$_baseUrl/login', body: {
      'email': _email,
      'password': _password,
    });

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      LoginResponse loginResponse = LoginResponse.fromJson(data);
      loginResponseCallback(loginResponse);

      return loginResponse;
    } else if (response.statusCode == 401) {
      print('_loginHandler - 3');

      try {
        print(response.statusCode);

        Map data = jsonDecode(response.body);
        LoginResponse res = LoginResponse.fromJson(data);
        if (res != null) {
          await _showErrorDialog(data['error']);
        }
      } on Error catch (error) {
        print('Error');
      }
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnLoginResponseCallback>(
      converter: (Store<AppState> store) {
        return (data) {
          store.dispatch(LoginResponseAction(loginResponse: data));
        };
      },
      builder:
          (BuildContext context, OnLoginResponseCallback loginResponseSave) {
        return Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: SafeArea(
              child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      CircleAvatar(
                        maxRadius: 40,
                        backgroundColor: Colors.transparent,
                        child: Image.asset('assets/images/shield.png'),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'some@gmail.com',
                          labelText: "Email",
                        ),
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                        validator: (value) {
                          print(value);
                          if (value.isEmpty) {
                            return 'Please enter email address';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Not correct email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                        onChanged: (value) {
                          setState(() {
                            _password = value;
                          });
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter your password';
                          }

                          return null;
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: ButtonTheme(
                            height: 60.0,
                            child: RaisedButton(
                              color: Colors.blueGrey,
                              textColor: Colors.white,
                              elevation: 5,
                              onPressed: () async {
                                // Validate will return true if the form is valid, or false if
                                // the form is invalid.
                                if (_formKey.currentState.validate()) {
                                  try {
                                    await _loginHandler(loginResponseSave);
                                  } catch (e) {
                                    print("Error $e");
                                  }
                                }
                              },
                              child: !isLoading
                                  ? Text('Login')
                                  : CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
