import 'package:flutter/material.dart';
import '../pages/login.dart';

//Utilizado stateful para permitir a animação
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

//Mantem o estado de Home, e adiciona o extra de um novo estado em cima do outro
//O Ticker é utilizado para fazer animações do Flutter, mixin controla uma unica animação
class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //late usada em variaveis inicializadas para ser usada depois
  late AnimationController _controller;
  //<double> usado em animação de escala
  late Animation<double> _animation;

  //Sobreescrevendo para inicializar o estado do widget
  @override
  void initState(){
    //chama para implementar o metodo init
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 1000), //duração da animação
    );
    _animation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(_controller);

    //vai repetir a animação ao contrário
    _controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          //Redirecionar pra uma nova pagina
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
          );
        },
        child: Stack(
          children: [
        Container(
        decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
          'assets/background/huliman_background.png',
        ),
        fit: BoxFit.cover, //preenche o fundo mantendo as proporções
      ),
    ),
      ),
          Padding(
            padding: EdgeInsets.only(top:50),
            child: Center(
              child: ScaleTransition(
                scale: _animation,
                child: Text(
                  'Clique em qualquer lugar para começar',
                  style: TextStyle(fontSize: 24.0, color: Colors.white,),
                ),
              ),
            ),
          )
        ],
      ),
      ),
    );
  }

}


