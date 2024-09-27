import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/atributos.dart';

void main() {
  testWidgets('Atributos widget test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Atributos(),
      ),
    );

    // Verifique se a AppBar é exibida corretamente
    _verifyAppBar(tester);

    // Verifique se os cartões são exibidos
    _verifyCharacterInfo(tester);

    // Verifique se os botões de adicionar e remover estão presentes
    _verifyAddRemoveButtons(tester);

    // Teste o LinearProgressIndicator
    _verifyProgressIndicators(tester);
  });
}

void _verifyAppBar(WidgetTester tester) {
  expect(find.text('Informações do Personagem'), findsOneWidget);
  expect(find.byIcon(Icons.arrow_back), findsOneWidget);
}

void _verifyCharacterInfo(WidgetTester tester) {
  expect(find.text('HALLEY'), findsOneWidget);
  expect(find.text('Pontos: 3'), findsOneWidget);
  expect(find.text('❤️'), findsOneWidget);
  expect(find.text('🗡️'), findsOneWidget);
  expect(find.text('Descrição dos Atributos'), findsOneWidget);
}

void _verifyAddRemoveButtons(WidgetTester tester) {
  expect(find.byIcon(Icons.add), findsNWidgets(2)); // Um para cada atributo
  expect(find.byIcon(Icons.remove), findsNWidgets(2)); // Um para cada atributo
}

void _verifyProgressIndicators(WidgetTester tester) {
  expect(find.byType(LinearProgressIndicator), findsNWidgets(3)); // Um para cada linha de progresso
}
