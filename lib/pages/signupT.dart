import 'package:flutter/material.dart';
import '../components/signupContainer.dart';
import 'signup.dart';

class SignUpT extends StatelessWidget {
  const SignUpT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SignupContainer(
            onContinuePressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp()),
              );
            },
            onLoginPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }
}
