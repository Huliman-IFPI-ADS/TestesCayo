import 'package:flutter/material.dart';
import 'planet_info.dart';

class Planets extends StatelessWidget {
  const Planets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SELECIONE O PLANETA QUE DESEJA BATALHAR'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlanetButton(
                title: 'História',
                image: 'assets/planets/PlanetaHistoria 1.png',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Planet_Info(),
                    ),
                  );
                },
              ),
              PlanetButton(
                title: 'Geografia',
                image: 'assets/planets/PlanetaGeografia 1.png',
                onPressed: null,
              ),
            ],
          ),
          SizedBox(height: 20), // Espaçamento entre as linhas
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlanetButton(
                title: 'Filosofia',
                image: 'assets/planets/PlanetaFilosofia 1.png',
                onPressed: null,
              ),
              PlanetButton(
                title: 'Sociologia',
                image: 'assets/planets/PlanetaSociologia 1.png',
                onPressed: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PlanetButton extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback? onPressed;

  const PlanetButton({
    required this.title,
    required this.image,
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
            height: 100, // Ajuste o tamanho da imagem conforme necessário
            width: 100,
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
