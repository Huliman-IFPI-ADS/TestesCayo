import 'package:flutter/material.dart';
import 'map.dart';

class VictoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00092C), // Cor de fundo azul escuro
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          width: 600,
          decoration: BoxDecoration(
            color: Color(0xFF121579),
            border: Border.all(color: Colors.white, width: 7), // Borda branca de 8 de largura
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o título
            children: [
              Text(
                "VITÓRIA",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Centraliza a imagem e o texto
                children: [
                  // Imagem do personagem com fundo branco circular
                  Container(
                    width: 140, // Ajuste a largura da imagem
                    height: 140, // Ajuste a altura da imagem
                    decoration: BoxDecoration(
                      color: Colors.white, // Fundo branco
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), // Espaçamento entre a imagem e o fundo branco
                      child: ClipOval(
                        child: Image.asset(
                          'assets/pop_up/pFeVitoria 2.png', // Substitua pelo caminho da sua imagem
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 30), // Espaçamento entre a imagem e o texto
                  // Caixa de texto com altura fixa
                  Container(
                    padding: EdgeInsets.all(12),
                    constraints: BoxConstraints(
                      maxHeight: 150, // Altura máxima da caixa de texto
                    ),
                    width: 300,
                    height: 300,// Largura fixa da caixa de texto
                    decoration: BoxDecoration(
                      color: Color(0xFF2894FF), // Fundo azul do texto
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Seus esforços foram compensados e você conseguiu derrotar seu inimigo com perfeição.",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 10), // Espaço entre as duas linhas de texto
                          Text(
                            "3 pontos de atributos recebidos.",
                            style: TextStyle(
                              color: Color(0xFFFF7700),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Ajuste manual da posição do botão
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 60),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => MapScreen(), // Página para a qual você deseja navegar
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF7700), // Cor de fundo laranja
                    foregroundColor: Colors.white, // Cor do texto branco
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(
                    "Continuar",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
