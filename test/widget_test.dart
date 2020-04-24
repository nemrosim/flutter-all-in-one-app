import 'package:authapp/app.dart';
import 'package:authapp/models/api/login_response.dart';
import 'package:authapp/models/store/app_state.dart';
import 'package:authapp/store/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:authapp/main.dart';
import 'package:redux/redux.dart';

void main() {
  testWidgets('show show header content', (WidgetTester tester) async {
    // Build an app and trigger a frame
    await tester.pumpWidget(App(
        store: Store<AppState>(
      appReducer,
      initialState: AppState(
        loginResponse: LoginResponse(
          token: null,
          refreshToken: null,
        ),
      ),
    )));

    // Should show main content app bar
    expect(find.text('Main content'), findsOneWidget);
  });

  testWidgets('click tile opens it', (WidgetTester tester) async {
    // Build an app and trigger a frame
    await tester.pumpWidget(App(
        store: Store<AppState>(
      appReducer,
      initialState: AppState(
        loginResponse: LoginResponse(
          token: null,
          refreshToken: null,
        ),
      ),
    )));

    // Should show main content app bar
    expect(find.byType(ExpansionTile), findsOneWidget);
    expect(find.byIcon(Icons.info), findsNothing);

    await tester.tap(find.byType(ExpansionTile));

    /**
     * pumpAndSettle can be used
     */
    await tester.pump();

    expect(find.byIcon(Icons.info), findsOneWidget);
  });
}
