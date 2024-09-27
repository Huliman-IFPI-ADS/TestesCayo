import 'package:flutter/material.dart';
import 'package:huliman_mobile/theme/app_colors.dart';
import '../components/text_input.dart';
import '../components/authBox.dart';

class LoginContainer extends StatelessWidget {
  final VoidCallback? onSignupPressed;
  final VoidCallback? onLoginPressed;

  const LoginContainer({
    Key? key,
    required this.onSignupPressed,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: AuthBox(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: [
                    Text_Input(
                      id: 1,
                      placeholder: 'Insira email ou usuário',
                    ),
                    SizedBox(height: 15.0),
                    Text_Input(
                      id: 2,
                      placeholder: 'Insira sua senha',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  key: const Key('loginButton'), // Adicione uma chave ao botão de login
                  onPressed: onLoginPressed,
                  child: Text('Entrar'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não possui conta?',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    if (onSignupPressed != null)
                      Flexible(
                        child: TextButton(
                          key: const Key('signupButton'),
                          onPressed: onSignupPressed!,
                          child: Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          titulo: 'Bem vindo ao Huliman!',
        ),
      ),
    );
  }
}
