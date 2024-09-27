import 'package:flutter/material.dart';
import 'package:huliman_mobile/theme/app_colors.dart';

class CrewBox extends StatelessWidget {
  final Widget crew;
  final String crewName;

  const CrewBox({
    Key? key,
    required this.crew,
    required this.crewName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 70,
        height: 140,
        // decoration: BoxDecoration(
        //   color: AppColors.orange,
        //   borderRadius: BorderRadius.circular(30),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              crewName,
              style: TextStyle(color: AppColors.orange, fontSize: 16,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2), // Adicionando espaço entre a imagem e o texto
            crew, // Adicionando a imagem como filho do Container
          ],
        ),
      ),
    );
  }
}
