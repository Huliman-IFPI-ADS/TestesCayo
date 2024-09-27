import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/planet_info.dart';
import 'package:huliman_mobile/pages/planets.dart';

void main() {
  // Cria um widget de teste para encapsular o MaterialApp
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: Planets(),
    );
  }

  group('Planets Widget Tests', () {
    testWidgets('Verifica a presença dos botões', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifica se os botões aparecem na tela
      expect(find.text('História'), findsOneWidget);
      expect(find.text('Geografia'), findsOneWidget);
      expect(find.text('Filosofia'), findsOneWidget);
      expect(find.text('Sociologia'), findsOneWidget);
    });

    testWidgets('Verifica a presença das imagens dos planetas', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifica se a imagem do planeta História é carregada
      expect(find.byType(Image), findsNWidgets(4)); // Verifica se há 4 imagens
    });

    testWidgets('Navegação para PlanetInfo ao tocar em História', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Simula um toque no botão "História" e verifica se a navegação ocorreu
      await tester.tap(find.text('História'));
      await tester.pumpAndSettle(); // Espera a animação de navegação

      // Verifica se a tela PlanetInfo foi exibida
      expect(find.byType(PlanetInfo), findsOneWidget);

      // Volta para a tela anterior
      Navigator.of(tester.element(find.byType(PlanetInfo))).pop();
      await tester.pumpAndSettle();
    });

    testWidgets('Verifica alerta ao tocar em Geografia', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Simula um toque no botão "Geografia" e verifica se o alerta aparece
      await tester.tap(find.text('Geografia'));
      await tester.pumpAndSettle();

      expect(find.text('Disponível em breve!'), findsOneWidget);

      // Fecha o alerta
      await tester.tap(find.text('Fechar'));
      await tester.pumpAndSettle();

      // Verifica que o alerta foi fechado
      expect(find.text('Disponível em breve!'), findsNothing);
    });
  });
}
