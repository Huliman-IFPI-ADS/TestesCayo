import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/signup.dart';
import 'package:huliman_mobile/pages/signupT.dart';
import 'package:huliman_mobile/components/signupContainer.dart';

void main() {
  testWidgets('SignUpT widget test', (WidgetTester tester) async {
    // Construa o widget
    await tester.pumpWidget(
      MaterialApp(
        home: SignUpT(),
      ),
    );

    // Verifique se o SignupContainer é encontrado
    expect(find.byType(SignupContainer), findsOneWidget);

    // Verifique se o botão de continuar está presente e simule um toque
    final continueButtonFinder = find.byKey(ValueKey('continueButtonKey')); // Certifique-se de usar a chave correta
    expect(continueButtonFinder, findsOneWidget);
    await tester.tap(continueButtonFinder);
    await tester.pumpAndSettle(); // Aguarde a navegação

    // Verifique se a tela SignUp foi exibida
    expect(find.byType(SignUp), findsOneWidget);

    // Verifique se o botão de login está presente e simule um toque
    final loginButtonFinder = find.byKey(ValueKey('loginButtonKey')); // Certifique-se de usar a chave correta
    expect(loginButtonFinder, findsOneWidget);
    await tester.tap(loginButtonFinder);
    await tester.pumpAndSettle(); // Aguarde a navegação

    // Verifique se a tela anterior foi exibida novamente
    expect(find.byType(SignUpT), findsOneWidget);
  });
}
