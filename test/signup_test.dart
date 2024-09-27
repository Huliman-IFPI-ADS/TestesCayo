import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/signup.dart';
import 'package:huliman_mobile/pages/login.dart';
import 'package:huliman_mobile/components/crewSelector.dart';

void main() {
  testWidgets('SignUp widget test', (WidgetTester tester) async {
    // Carrega o widget SignUp
    await tester.pumpWidget(
      MaterialApp(
        home: SignUp(),
      ),
    );

    // Verifica se o CrewSelector está presente
    expect(find.byType(CrewSelector), findsOneWidget);

    // Verifica se o botão de login está presente
    expect(find.text('Login'), findsOneWidget);

    // Simula o pressionamento do botão de login
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle(); // Aguarda as animações

    // Verifica se a página de login foi aberta
    expect(find.byType(Login), findsOneWidget);
  });
}
