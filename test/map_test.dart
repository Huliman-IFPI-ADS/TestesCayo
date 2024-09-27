import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/map.dart';

void main() {
  // Função auxiliar para criar o widget MapScreen
  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: MapScreen(),
    );
  }

  group('MapScreen Widget Tests', () {
    testWidgets('Verifica a presença da imagem de fundo', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Verifica se a imagem de fundo está sendo exibida
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Verifica o botão de ataque e a resposta ao toque', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Busca pelo GestureDetector usando a Key
      final attackButton = find.byKey(Key('attack_button'));
      expect(attackButton, findsOneWidget);

      // Toca no botão e verifica se o diálogo aparece
      await tester.tap(attackButton);
      await tester.pumpAndSettle(); // Aguarda a animação do diálogo

      // Verifica se o diálogo aparece
      expect(find.byType(Dialog), findsOneWidget);
    });

    testWidgets('Verifica o conteúdo do diálogo', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Busca pelo GestureDetector usando a Key
      await tester.tap(find.byKey(Key('attack_button')));
      await tester.pumpAndSettle(); // Aguarda a animação do diálogo

      // Verifica se o texto "Lady Bell" está presente no diálogo
      expect(find.text('Lady Bell'), findsOneWidget);

      // Verifica se o botão 'Fugir' está presente no diálogo
      expect(find.text('Fugir'), findsOneWidget);

      // Verifica se o botão 'Atacar' está presente no diálogo
      expect(find.text('Atacar'), findsOneWidget);
    });

    testWidgets('Verifica a funcionalidade do botão Fugir no diálogo', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      // Busca pelo GestureDetector usando a Key
      await tester.tap(find.byKey(Key('attack_button')));
      await tester.pumpAndSettle(); // Aguarda a animação do diálogo

      // Toca no botão 'Fugir' e verifica se o diálogo desaparece
      await tester.tap(find.text('Fugir'));
      await tester.pumpAndSettle(); // Aguarda a animação de fechamento

      // Verifica se o diálogo não está mais presente
      expect(find.byType(Dialog), findsNothing);
    });
  });
}
