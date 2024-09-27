import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/victory.dart';
import 'package:huliman_mobile/pages/map.dart';

void main() {
  testWidgets('VictoryScreen displays title correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VictoryScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Verifique se o título está presente
    expect(find.text('VITÓRIA'), findsOneWidget);
  });

  testWidgets('VictoryScreen displays character image', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VictoryScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Verifique se a imagem do personagem está presente
    expect(find.byType(Image), findsOneWidget);
  });

  testWidgets('VictoryScreen displays victory message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VictoryScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Verifique se o texto de vitória está presente
    expect(find.text('Seus esforços foram compensados e você conseguiu derrotar seu inimigo com perfeição.'), findsOneWidget);
  });

  testWidgets('VictoryScreen displays points message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VictoryScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Verifique se o texto de pontos está presente
    expect(find.text('3 pontos de atributos recebidos.'), findsOneWidget);
  });

  testWidgets('VictoryScreen displays continue button', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VictoryScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Verifique se o botão "Continuar" está presente
    expect(find.text('Continuar'), findsOneWidget);
  });

  testWidgets('VictoryScreen navigates to MapScreen when continue button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: VictoryScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Simule um toque no botão
    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle(); // Aguarda a navegação

    // Verifique se a tela do mapa foi exibida
    expect(find.byType(MapScreen), findsOneWidget);
  });
}
