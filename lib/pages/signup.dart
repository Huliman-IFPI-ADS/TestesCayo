import 'package:flutter/material.dart';
import '../components/crewSelector.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CrewSelector(
            onFinishedPressed: () {
              print('Cadastro finalizado');
            },
            onLoginPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ),
      ),
    );
  }
}
