import 'package:flutter/material.dart';
import 'map.dart';
import '../components/custom_app_bar.dart';

class PlanetInfo extends StatelessWidget {
  const PlanetInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'INFORMAÇÕES DO PLANETA'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagem do planeta ao lado esquerdo
            Container(
              padding: EdgeInsets.only(right: 16.0), // Espaçamento entre a imagem e a caixa de texto
              child: Image.asset(
                'assets/planets/PlanetaHistoria.png', // Substitua pelo caminho da sua imagem
                height: 250, // Ajuste a altura conforme necessário
              ),
            ),

            // Caixa de descrição
            Container(
              width: 420, // Largura da caixa
              height: 260, // Altura da caixa
              decoration: BoxDecoration(
                color: Color(0xFF121579),
                border: Border.all(color: Colors.white, width: 7), // Borda branca da caixa
                borderRadius: BorderRadius.circular(30.0), // Arredondamento da borda
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Título (Planeta História)
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFFF7700), // Cor laranja
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0), // Arredondamento superior esquerdo
                        topRight: Radius.circular(20.0), // Arredondamento superior direito
                      ),
                    ),
                    padding: EdgeInsets.all(8.0), // Espaçamento interno
                    child: Text(
                      'Planeta História',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 14.0), // Espaço entre o título e o conteúdo
                  // Descrição do planeta com rolagem
                  Align(
                    alignment: Alignment.center, // Ajuste conforme necessário
                    child: Container(
                      width: 450, // Largura desejada
                      height: 100, // Altura máxima da caixa de descrição
                      decoration: BoxDecoration(
                        color: Color(0xFF2894FF), // Azul mais escuro
                        borderRadius: BorderRadius.circular(14.0), // Arredondamento da borda
                      ),
                      padding: EdgeInsets.all(16.0), // Espaçamento interno
                      child: SingleChildScrollView(
                        child: Text(
                          'Este planeta possui uma vasta coleção de registros históricos, '
                              'mantidos por gerações para garantir que os erros do passado não sejam repetidos. '
                              'Sua população valoriza o conhecimento histórico acima de tudo, e suas decisões '
                              'são sempre fundamentadas em lições do passado.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:8.0), // Espaço entre o conteúdo e o botão

                  // Botão "Continuar"
                  Container(
                    padding: EdgeInsets.all(6.0), // Espaçamento para o botão
                    child: Align(
                      alignment: Alignment.center, // Ajuste a posição conforme necessário
                      child: Container(
                        width: 170, // Largura desejada
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => MapScreen(), // Página para a qual você deseja navegar
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF7700),
                            foregroundColor: Colors.white,//
                            minimumSize: Size(double.infinity, 50), //
                          ),
                          child: Text('Continuar'),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
