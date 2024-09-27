import 'package:flutter/material.dart';
import '../components/custom_app_bar.dart'; // Importe o arquivo onde o CustomAppBar está definido
import 'planets.dart'; // Importe a página de destino aqui

class Galaxy extends StatelessWidget {
  const Galaxy({Key? key}) : super(key: key);

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Aviso",
            style: TextStyle(color: Colors.black), // Cor do texto
          ),
          content: Text(
            "Uma nova galáxia poderá ser visitada logo logo.",
            style: TextStyle(color: Colors.black), // Cor do texto
          ),
          actions: [
            TextButton(
              child: Text(
                "Fechar",
                style: TextStyle(color: Colors.black), // Cor do botão
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: Colors.white, // Cor de fundo do aviso
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'SELECIONE A GALAXIA QUE DESEJA BATALHAR'),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  key: Key('arrow_left'), // Adicione uma chave
                  icon: Icon(Icons.arrow_left, size: 48),
                  onPressed: () => _showMessage(context),
                ),
                // Imagem central
                Image.asset(
                  'assets/galaxys/GalaxiaHumanas.png',
                  width: 300,
                  height: 300,
                ),
                IconButton(
                  key: Key('arrow_right'), // Adicione uma chave
                  icon: Icon(Icons.arrow_right, size: 48),
                  onPressed: () => _showMessage(context),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Ação ao pressionar "Confirmar"
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Planets(), // Página para a qual você deseja navegar
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF7700), // Cor laranja para o botão
                foregroundColor: Colors.white,
              ),
              child: Text('Confirmar'),
            ),
          ),
        ],
      ),
    );
  }
}
