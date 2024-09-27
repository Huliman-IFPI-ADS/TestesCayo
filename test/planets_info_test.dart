import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/planet_info.dart';
import 'package:huliman_mobile/pages/map.dart';

void main() {
  // Cria um widget de teste para encapsular o MaterialApp
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: PlanetInfo(),
    );
  }

  group('PlanetInfo Widget Tests', () {
    testWidgets('Verifica a presença da imagem do planeta', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifique se a imagem do planeta está presente
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Verifica a presença do título do planeta', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifique se o título 'Planeta História' é exibido
      expect(find.text('Planeta História'), findsOneWidget);
    });

    testWidgets('Verifica a descrição do planeta', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifique se a descrição do planeta é exibida
      expect(find.byWidgetPredicate((widget) {
        return widget is Text && widget.data!.contains('vasta coleção de registros históricos');
      }), findsOneWidget);
    });

    testWidgets('Verifica a presença do botão Continuar', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifique se o botão 'Continuar' está presente
      expect(find.text('Continuar'), findsOneWidget);
    });

    testWidgets('Navegação para a tela do mapa ao clicar em Continuar', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Simule um clique no botão 'Continuar'
      await tester.tap(find.text('Continuar'));

      // Rebuild the widget after the state has changed
      await tester.pumpAndSettle();

      // Verifique se a navegação ocorreu para a tela do mapa
      expect(find.byType(MapScreen), findsOneWidget);
    });
  });
}
