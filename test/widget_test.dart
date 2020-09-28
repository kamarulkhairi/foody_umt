// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:foody_umt/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
// Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           TextField(
//             keyboardType: TextInputType.emailAddress,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//               email = value;
//               print(email);
//             },
//           ),
//           TextField(
//             obscureText: true,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//               password = value;
//             },
//           ),
//           FloatingActionButton(
//               child: Text(
//                 'Register',
//                 textAlign: TextAlign.center,
//               ),
//               onPressed: () async {
//                 try {
//                   UserCredential newUser =
//                       await _auth.createUserWithEmailAndPassword(
//                           email: email, password: password);
//                   print(newUser);
//                   if (newUser != null) {
//                     Navigator.pushNamed(context, HomePage.id);
//                   }
//                 } on FirebaseAuthException catch (err) {
//                   if (err.code == 'weak-password') {
//                     print('password is to weak');
//                   } else if (err.code == 'email-already-in-use') {
//                     print('account existed');
//                   }
//                 } catch (err) {
//                   print(err.toString());
//                 }
//               })
//         ],
//       ),