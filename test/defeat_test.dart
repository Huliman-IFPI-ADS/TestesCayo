import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/defeat.dart';
import 'package:huliman_mobile/pages/map.dart';

void main() {
  testWidgets('DefeatScreen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DefeatScreen(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('DERROTA'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text("Ah, parece que sua jornada chegou a um fim lamentável. Você não foi páreo para o meu poder e astúcia."), findsOneWidget);
    expect(find.text('Continuar'), findsOneWidget);
  });

  testWidgets('Image is displayed correctly in DefeatScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DefeatScreen(),
      ),
    );

    await tester.pumpAndSettle();

    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    // Verifica se a imagem é a correta
    final imageWidget = tester.widget<Image>(imageFinder);
    expect(imageWidget.image, isA<AssetImage>());
  });

  testWidgets('Text in defeat message is correct', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DefeatScreen(),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text("Ah, parece que sua jornada chegou a um fim lamentável. Você não foi páreo para o meu poder e astúcia."), findsOneWidget);
  });

  testWidgets('Continuar button has correct styling', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DefeatScreen(),
      ),
    );

    await tester.pumpAndSettle();

    // Encontre o botão "Continuar"
    final buttonFinder = find.byType(ElevatedButton);
    expect(buttonFinder, findsOneWidget);

    // Verifique se o botão tem o estilo correto
    final ElevatedButton button = tester.widget<ElevatedButton>(buttonFinder);
    expect(button.style?.backgroundColor?.resolve({}), Color(0xFFFF7700));
    expect(button.style?.foregroundColor?.resolve({}), Colors.white);
  });


  testWidgets('DefeatScreen navigates to MapScreen when button is pressed', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DefeatScreen(),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.text('Continuar'));
    await tester.pumpAndSettle();

    expect(find.byType(MapScreen), findsOneWidget);
  });
}
