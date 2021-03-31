import 'package:flutter/material.dart';
import 'package:test_auth/screens/home_screen.dart';
import 'package:test_auth/services/google_sign_service.dart';

class LoginScreen extends StatelessWidget {
  final CustomGoogleSignInService auth = CustomGoogleSignInService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                auth
                    .googleSignIn()
                    .then(
                      (user) => {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            user: user,
                          ),
                        ))
                      },
                    )
                    .catchError((e) {
                  print(e);
                });
              },
              child: Text('Google'),
            ),
          ],
        ),
      ),
    );
  }
}
