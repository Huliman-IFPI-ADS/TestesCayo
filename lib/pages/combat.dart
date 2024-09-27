import 'package:flutter/material.dart';
import 'victory.dart';
import 'defeat.dart';
import 'map.dart';

void main() {
  runApp(Combat());
}

class Combat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF00092C),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final List<Map<String, Object>> _questions = [
    {
      'question': 'Os primeiros invasores a chegar ao Brasil foram os portugueses, liderados por...',
      'answers': ['Cristóvão Colombo', 'Pedro Álvares Cabral', 'Dom Pedro II', 'Francisco de Oliveira'],
      'correctAnswer': 'Pedro Álvares Cabral',
      'hint': 'Foi o responsável pelo descobrimento do Brasil.',
    },
    {
      'question': 'A Independência do Brasil foi proclamada em...',
      'answers': ['7 de setembro de 1822', '15 de novembro de 1889', '25 de março de 1824', '21 de setembro de 1822'],
      'correctAnswer': '7 de setembro de 1822',
      'hint': 'Esse evento é comemorado anualmente em setembro.',
    },
    {
      'question': 'O movimento das Diretas Já ocorreu em...',
      'answers': ['1984', '1979', '1964', '1992'],
      'correctAnswer': '1984',
      'hint': 'Esse movimento aconteceu na década de 1980.',
    },
    {
      'question': 'A Lei Áurea foi assinada em...',
      'answers': ['1871', '1888', '1822', '1789'],
      'correctAnswer': '1888',
      'hint': 'Foi o fim da escravidão no Brasil, que aconteceu no século 18',
    },
    {
      'question': 'O primeiro presidente do Brasil foi...',
      'answers': ['Getúlio Vargas', 'Dom Pedro I', 'Deodoro da Fonseca', 'Juscelino Kubitschek'],
      'correctAnswer': 'Deodoro da Fonseca',
      'hint': 'Ele foi um militar e o primeiro presidente do Brasil.',
    },
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;
  int _mistakes = 0;
  double _playerHealth = 1.0; // Vida do jogador (100%)
  double _enemyHealth = 1.0;  // Vida do oponente (100%)
  bool _hasUsedHint = false;
  String? _selectedAnswer;
  Color? _buttonColor; // Para controlar a cor temporária do botão

  void _answerQuestion(String selectedAnswer) {
    String correctAnswer = _questions[_currentQuestionIndex]['correctAnswer'] as String;

    setState(() {
      _selectedAnswer = selectedAnswer;
      if (selectedAnswer == correctAnswer) {
        _buttonColor = Colors.green; // Cor verde para acerto
        _score++;
        _enemyHealth -= 0.33; // Oponente perde vida a cada acerto
      } else {
        _buttonColor = Colors.red; // Cor vermelha para erro
        _mistakes++;
        _playerHealth -= 0.33; // Jogador perde vida a cada erro
      }

      // Aguarda 1 segundo antes de ir para a próxima pergunta
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _buttonColor = null; // Reseta a cor após o efeito
          if (_score == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => VictoryScreen()),
            );
          } else if (_mistakes == 3) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => DefeatScreen()),
            );
          } else if (_currentQuestionIndex < _questions.length - 1) {
            _currentQuestionIndex++;
          }
          _selectedAnswer = null;
        });
      });
    });
  }

  void _showHintDialog() {
    String hint = _questions[_currentQuestionIndex]['hint'] as String;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DicaDialog(
          hintText: hint,
          onContinue: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.5;
    double iconSize = 36;

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: containerWidth,
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    IconButton(
                      iconSize: iconSize,
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirmação"),
                              content: Text("Você realmente quer sair do questionário?"),
                              actions: [
                                TextButton(
                                  child: Text("Cancelar"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                TextButton(
                                  child: Text("Sair"),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => MapScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    IconButton(
                      iconSize: iconSize,
                      icon: Icon(Icons.help, color: Colors.white),
                      onPressed: _hasUsedHint
                          ? null
                          : () {
                        setState(() {
                          _hasUsedHint = true;
                        });
                        _showHintDialog();
                      },
                    ),
                  ],
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Container(
                    width: containerWidth * 1.0,
                    height: 380,
                    margin: EdgeInsets.only(top: 24),
                    decoration: BoxDecoration(
                      color: Color(0xFF121579),
                      border: Border.all(color: Colors.white, width: 7),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 75,
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xFF2894FF),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: SingleChildScrollView(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  _questions[_currentQuestionIndex]['question'] as String,
                                  style: TextStyle(color: Colors.white, fontSize: 16),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 1),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: (_questions[_currentQuestionIndex]['answers'] as List<String>)
                                .map((answer) => optionButton(answer, containerWidth, context))
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 380,
                    height: 450,
                    child: Image.asset(
                      'assets/background/fundoBatalha 1.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Barra de vida do oponente
                Positioned(
                  top: 50,
                  right: 130,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    child: Container(
                      width: 100,
                      height: 8, // Largura da barra de vida
                      child: LinearProgressIndicator(
                        value: _enemyHealth,
                        backgroundColor: Colors.red[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    ),
                  ),
                ),
                // Imagem do oponente
                Positioned(
                  top: 20,
                  right: 85,
                  child: Image.asset(
                    'assets/persons/battle/inimigoAtaque 1.png',
                    width: 180,
                    height: 220,
                  ),
                ),
                // Barra de vida do jogador
                Positioned(
                  bottom: 180,
                  left: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8), // Bordas arredondadas
                    child: Container(
                      width: 70, // Largura da barra de vida
                      height: 8,
                      child: LinearProgressIndicator(
                        value: _playerHealth,
                        backgroundColor: Colors.green[200],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      ),
                    ),
                  ),
                ),
                // Imagem do jogador
                Positioned(
                  bottom: 40,
                  left: 40,
                  child: Image.asset(
                    'assets/persons/battle/girlAtirarma 1.png',
                    width: 270,
                    height: 140,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget optionButton(String text, double containerWidth, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: containerWidth * 0.73,
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _selectedAnswer == text
                ? _buttonColor // Se for a resposta escolhida, muda de cor
                : Color(0xFFFF7700), // Cor padrão
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(0),
          ),
          onPressed: () {
            if (_selectedAnswer == null) { // Impede múltiplas seleções durante o delay
              _answerQuestion(text);
            }
          },
          child: SingleChildScrollView(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

class DicaDialog extends StatelessWidget {
  final String hintText;
  final VoidCallback onContinue;

  DicaDialog({required this.hintText, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      backgroundColor: Colors.transparent,
      content: Container(
        padding: EdgeInsets.all(16),
        width: 500,
        decoration: BoxDecoration(
          color: Color(0xFF121579),
          border: Border.all(width: 4, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/pop_up/boyPopUp 1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      color: Color(0xFF2894FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          hintText,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFF7700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Continuar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
