import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/login.dart';
import 'package:huliman_mobile/pages/galaxy.dart';
import 'package:huliman_mobile/pages/signupT.dart';

void main() {
  testWidgets('Teste de navegação para Galaxy', (tester) async {
    // Crie um widget de teste
    await tester.pumpWidget(
      MaterialApp(
        home: Login(),
      ),
    );

    // Encontre o botão de login
    final loginButton = find.byKey(const Key('loginButton'));

    // Verifique se o botão de login existe
    expect(loginButton, findsOneWidget);

    // Simule um clique no botão de login
    await tester.tap(loginButton);

    // Verifique se a navegação para Galaxy foi realizada
    expect(find.byType(Galaxy), findsOneWidget);
  });

  testWidgets('Teste de navegação para SignUpT', (tester) async {
    // Crie um widget de teste
    await tester.pumpWidget(
      MaterialApp(
        home: Login(),
      ),
    );

    // Encontre o botão de signup
    final signupButton = find.byKey(const Key('signupButton'));

    // Verifique se o botão de signup existe
    expect(signupButton, findsOneWidget);

    // Simule um clique no botão de signup
    await tester.tap(signupButton);

    // Verifique se a navegação para SignUpT foi realizada
    expect(find.byType(SignUpT), findsOneWidget);
  });
}