import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  String _baseUrl = DotEnv().env['BASE_URL'];

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _loginHandler() async {
    setState(() {
      isLoading = true;
    });

    final http.Response response = await http.post('$_baseUrl/login', body: {
      'email': 'hello',
    });

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      await _neverSatisfied();
      print(response.statusCode);
      print(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                              await _loginHandler();

                              // Validate will return true if the form is valid, or false if
                              // the form is invalid.
                              if (_formKey.currentState.validate()) {
                                // Process data.
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
      ),
    );
  }
}
