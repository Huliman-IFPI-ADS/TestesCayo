import 'package:flutter/material.dart';
import 'crewBox.dart';
import '../components/authBox.dart';
import '../theme/app_colors.dart';

class CrewSelector extends StatelessWidget {
  final VoidCallback? onFinishedPressed;
  final VoidCallback? onLoginPressed;

  const CrewSelector({
    Key? key,
    required this.onFinishedPressed,
    required this.onLoginPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AuthBox(
          titulo: 'Selecione um tripulante',
          showBackButton: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CrewBox(
                    crewName: 'Bopp',
                    crew: Image.asset('assets/crewmates/boppSelect.png'),
                  ),
                  SizedBox(width: 50),
                  CrewBox(
                    crewName: 'Halley',
                    crew: Image.asset('assets/crewmates/halleySelect.png'),
                  ),
                ],
              ),
              SizedBox(height: 8.0,),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: onFinishedPressed,
                  child: Text('Cadastrar'),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(), // Adicione o espaçamento ao topo
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui acesso?',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
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
        ),
      ),
    );
  }
}
