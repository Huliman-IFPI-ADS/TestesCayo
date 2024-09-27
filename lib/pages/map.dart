import 'package:flutter/material.dart';
import 'combat.dart';
import '../components/custom_app_bar.dart';
import 'galaxy.dart';//
import 'atributos.dart';// Certifique-se de que 'combat.dart' está no mesmo diretório ou ajuste o caminho conforme necessário

void main() {
  runApp(MaterialApp(
    home: MapScreen(),
  ));
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double _scale = 1.0;
  Offset _zoomCenter = Offset.zero;
  bool _isDialogOpen = false;
  bool _showBackground = true;
  bool _showButton = true; // Controla a visibilidade do botão
  Size _imageSize = Size.zero;

  void _onButtonTap(Offset clickPosition, Size imageSize) {
    setState(() {
      _imageSize = imageSize;
      _zoomCenter = clickPosition; // Define o centro do zoom
      _scale = 1.8; // Ajuste o nível de zoom conforme necessário
      _isDialogOpen = true;
      _showBackground = false; // Oculta a imagem de fundo
      _showButton = false; // Oculta o botão
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Row(
            children: [
              // Área de zoom à esquerda
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0), // Ajusta o espaçamento
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 1 / _scale,
                      heightFactor: 1 / _scale,
                      child: Transform(
                        alignment: Alignment.topLeft,
                        transform: Matrix4.identity()
                          ..translate(
                            -_zoomCenter.dx * (_scale - -7),
                            -_zoomCenter.dy * (_scale - 1),
                          )
                          ..scale(_scale),
                        child: Image.asset('assets/background/mapaNew 1.png'),
                      ),
                    ),
                  ),
                ),
              ),
              // Conteúdo do diálogo à direita
              Expanded(
                flex: 1,
                child: Container(
                  width: 250,
                  // Tamanho fixo da caixa geral do diálogo
                  height: 300,
                  // Tamanho fixo da caixa geral do diálogo
                  padding: EdgeInsets.all(12),
                  // Ajusta o padding
                  decoration: BoxDecoration(
                    color: Color(0xFF121579),
                    border: Border.all(color: Colors.white, width: 8),
                    // Cor hexadecimal para o fundo do diálogo
                    borderRadius:
                    BorderRadius.circular(14), // Bordas arredondadas
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lady Bell',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20, // Tamanho da fonte
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10), // Ajusta o espaçamento
                      // Espaço para a imagem
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        // Bordas arredondadas para a imagem
                        child: Image.asset('assets/pop_up/iconInimigo.png',
                            width: 140,
                            height:
                            80), // Aumenta a largura e altura da imagem
                      ),
                      SizedBox(height: 5), // Ajusta o espaçamento
                      Container(
                        height: 80,
                        width: 400,
                        // Altura fixa da caixa de texto
                        padding:
                        EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                        // Ajusta o padding
                        decoration: BoxDecoration(
                          color: Color(0xFF2894FF),
                          // Cor hexadecimal para o fundo do texto
                          borderRadius:
                          BorderRadius.circular(14), // Bordas arredondadas
                        ),
                        child: SingleChildScrollView(
                          child: Text(
                            'Para derrotar este boss você precisa ter conhecimentos em História do Brasil. Este é um texto longo que será exibido com rolagem se ultrapassar o limite fixo da caixa de texto.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17, // Tamanho da fonte
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 5), // Ajusta o espaçamento
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                _scale = 1.0;
                                _isDialogOpen = false;
                                _showBackground =
                                true; // Restaura a imagem de fundo
                                _showButton = true; // Restaura o botão
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    6), // Reduz o raio das bordas
                              ),
                              minimumSize: Size(
                                  60, 30), // Ajusta o tamanho mínimo dos botões
                            ),
                            child: Text('Fugir'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Combat(), // Navega para a tela Combat
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    6), // Reduz o raio das bordas
                              ),
                              minimumSize: Size(
                                  60, 30), // Ajusta o tamanho mínimo dos botões
                            ),
                            child: Text('Atacar'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'MAPA DO PLANETA HISTÓRIA',
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Defina a cor e o ícone desejado aqui
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Galaxy(),
              ),
            );
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0), // Ajuste este valor para mover o ícone de settings
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Atributos(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          if (_showBackground)
            Center(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Pega o tamanho da imagem para calcular o zoom corretamente
                  return Image.asset(
                    'assets/background/mapaNew 1.png',
                    fit: BoxFit.contain,
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                  );
                },
              ),
            ),
          // Botão fixo no mapa, visível apenas se _showButton for verdadeiro
          if (_showButton)
            Positioned(
              left: 544, // Ajuste a posição conforme necessário
              top: 35, // Ajuste a posição conforme necessário
              child: GestureDetector(
                key: Key('attack_button'),
                onTapDown: (details) {
                  // Passa a posição do clique e o tamanho da imagem
                  _onButtonTap(details.localPosition,
                      Size(465, 50)); // Ajuste o tamanho conforme necessário
                },
                child: Container(
                  width: 22, // Aumenta a área do botão
                  height: 35, // Aumenta a área do botão
                  decoration: BoxDecoration(
                    color: Colors.red[700],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
  }
