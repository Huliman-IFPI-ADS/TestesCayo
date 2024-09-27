import 'package:flutter/material.dart';

class Atributos extends StatelessWidget {
  const Atributos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF7700),
        title: Text(
          'Informações do Personagem',
          style: TextStyle(color: Colors.white), // Texto branco
        ),
        centerTitle: true, // Centralizando o título
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Flecha branca
          onPressed: () {
            Navigator.pop(context); // Volta para a página anterior
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Linha superior
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildProfileCard(),
                    SizedBox(width: 60),
                    _buildBaseAttributesCard(),
                  ],
                ),
                SizedBox(height: 20),
                // Linha com progresso e descrição
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProgressCard(), // Card de progresso
                    SizedBox(width: 60),
                    _buildAttributeDescriptionCard(), // Card de descrição com rolagem
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Card do Perfil
  Widget _buildProfileCard() {
    return Container(
      width: 240,
      height: 150,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF1226AC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/pop_up/girlPopUp 1.png'),
          ),
          SizedBox(height: 8),
          Text(
            'HALLEY',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  // Card de Atributos Base
  Widget _buildBaseAttributesCard() {
    return Container(
      width: 240,
      height: 180,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF1226AC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Pontos: 3',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8),
          _buildAttributeRow('❤️', '5'),
          SizedBox(height: 8),
          _buildAttributeRow('🗡️', '10'),
        ],
      ),
    );
  }

  // Widget da linha de atributos com botões de + e -
  Widget _buildAttributeRow(String icon, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          icon,
          style: TextStyle(fontSize: 24),
        ),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove, color: Colors.white),
              onPressed: () {
                // Lógica para diminuir o valor do atributo
              },
            ),
            SizedBox(width: 4),
            IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () {
                // Lógica para aumentar o valor do atributo
              },
            ),
          ],
        ),
      ],
    );
  }

  // Card de Progresso
  Widget _buildProgressCard() {
    return Container(
      height: 150,
      width: 240,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF1226AC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProgressRow('assets/planets/PlanetaFilosofia 1.png', 0),
          SizedBox(height: 8),
          _buildProgressRow('assets/planets/PlanetaGeografia 1.png', 0),
          SizedBox(height: 8),
          _buildProgressRow('assets/planets/PlanetaHistoria.png', 0),
        ],
      ),
    );
  }

  // Linha de progresso com controle de tamanho
  Widget _buildProgressRow(String assetPath, double progress) {
    return Row(
      children: [
        Image.asset(assetPath, width: 30, height: 30),
        SizedBox(width: 8),
        Expanded(
          child: LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white,
            color: Color(0xFF0070FF),
            minHeight: 8,
          ),
        ),
        SizedBox(width: 8),
        Text(
          '${(progress * 100).toInt()}%',
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  // Card de Descrição dos Atributos com rolagem e texto justificado
  Widget _buildAttributeDescriptionCard() {
    return Container(
      height: 150,
      width: 240,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF1226AC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white, width: 4),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centraliza o conteúdo horizontalmente
          children: [
            Text(
              'Descrição dos Atributos',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Pontos de Saúde',
              style: TextStyle(color: Color(0xFF2894FF), fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              '• Aumentar a quantidade máxima de vida permite com que o tripulante sofra mais dano antes do nocaute.',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.justify, // Justifica o texto
            ),
          ],
        ),
      ),
    );
  }
}
