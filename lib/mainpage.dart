import 'package:flutter/material.dart';
import './screens/homepage.dart';
import './screens/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LoginPage(onSignInError: () {
              _showInvalidCredentialsDialog(context);
            });
          }
        },
      ),
    );
  }

  void _showInvalidCredentialsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Credentials'),
          content: Text('The username and password entered are invalid.'),
          actions: <Widget>[
            TextButton(
              
              child: Icon(Icons.close),
              onPressed: () {
                Navigator.of(context).pop();
              },
              ),
            
          ],
        );
      },
    );
  }
}
