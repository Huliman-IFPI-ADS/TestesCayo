import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../pages/home.dart';
import '../theme/app_theme.dart';
import '../pages/login.dart';
import '../components/crewSelector.dart';
import '../pages/combat.dart';
import '../pages/defeat.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Certifica-se de que o binding do Flutter foi inicializado
  //Seta a orientação do celular deitado
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  //esconde a barra de tarefas
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Huliman",
      theme: AppTheme.theme,
      home: const Home(),

    );
  }
}
