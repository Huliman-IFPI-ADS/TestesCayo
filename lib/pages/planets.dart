import 'package:flutter/material.dart';
import 'planet_info.dart';
import '../components/custom_app_bar.dart';

class Planets extends StatelessWidget {
  const Planets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SELECIONE O PLANETA QUE DESEJA BATALHAR'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlanetButton(
                title: 'História',
                image: 'assets/planets/PlanetaHistoria 1.png',
                height: 100, // Ajuste individual do tamanho
                width: 130,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PlanetInfo(),
                    ),
                  );
                },
              ),
              PlanetButton(
                title: 'Geografia',
                image: 'assets/planets/PlanetaGeografia 1.png',
                height: 100, // Ajuste individual do tamanho
                width: 140,
                onPressed: () {
                  _showComingSoonAlert(context);
                },
              ),
            ],
          ),
          SizedBox(height: 40), // Espaçamento entre as linhas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlanetButton(
                title: 'Filosofia',
                image: 'assets/planets/PlanetaFilosofia 1.png',
                height: 90, // Ajuste individual do tamanho
                width: 110,
                onPressed: () {
                  _showComingSoonAlert(context);
                },
              ),
              PlanetButton(
                title: 'Sociologia',
                image: 'assets/planets/PlanetaSociologia 1.png',
                height: 90, // Ajuste individual do tamanho
                width: 130,
                onPressed: () {
                  _showComingSoonAlert(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showComingSoonAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Disponível em breve!',
            style: TextStyle(color: Colors.black), // Cor do texto
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Fechar',
                style: TextStyle(color: Colors.black), // Cor do botão
              ),
            ),
          ],
          backgroundColor: Colors.white, // Cor de fundo do alerta
        );
      },
    );
  }
}

class PlanetButton extends StatelessWidget {
  final String title;
  final String image;
  final double height;
  final double width;
  final VoidCallback? onPressed;

  const PlanetButton({
    required this.title,
    required this.image,
    required this.height,
    required this.width,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Image.asset(
            image,
            height: height, // Tamanho individual da imagem
            width: width,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
