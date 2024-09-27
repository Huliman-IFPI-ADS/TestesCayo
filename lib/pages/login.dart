import 'package:flutter/material.dart';
import '../components/loginContainer.dart';
import 'galaxy.dart';
import 'signup.dart';
import 'signupT.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: LoginContainer(
            onLoginPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Galaxy()),
              );
            },
            onSignupPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpT()),
              );
            },
          ),
        ),
      ),
    );
  }
}
