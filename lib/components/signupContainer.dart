import 'package:flutter/material.dart';
import 'package:huliman_mobile/theme/app_colors.dart';
import '../components/text_input.dart';
import '../components/authBox.dart';

class SignupContainer extends StatelessWidget {
  final VoidCallback? onContinuePressed;
  final VoidCallback? onLoginPressed;

  const SignupContainer({
    Key? key,
    required this.onContinuePressed,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: AuthBox(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5), // Corrigi a linha de código
                child: Column(
                  children: [
                    Text_Input(
                      id: 3,
                      placeholder: 'Insira nome de usuário',
                    ),
                    SizedBox(height: 8.0),
                    Text_Input(
                      id: 4,
                      placeholder: 'Insira seu email',
                    ),
                    SizedBox(height: 8.0),
                    Text_Input(
                      id: 5,
                      placeholder: 'Insira uma senha',
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onContinuePressed,
                  child: Text('Continuar'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui acesso?',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ), // Adiciona o texto adicional, se fornecido
                    if (onLoginPressed != null)
                      TextButton(
                        onPressed: onLoginPressed!,
                        child: Text(
                          'Entre agora',
                          style: TextStyle(
                            color: AppColors.orange,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          titulo: 'Crie uma nova conta no Huliman!',
        ),
      ),
    );
  }
}
