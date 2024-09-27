import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:huliman_mobile/pages/galaxy.dart';
import 'package:huliman_mobile/pages/planets.dart';

void main() {
  group('Galaxy widget tests', () {
    testWidgets('renders AppBar and title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Galaxy(),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text('SELECIONE A GALAXIA QUE DESEJA BATALHAR'), findsOneWidget);
    });

    testWidgets('renders image and navigation buttons', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Galaxy(),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      expect(find.byIcon(Icons.arrow_left), findsOneWidget);
      expect(find.byIcon(Icons.arrow_right), findsOneWidget);
      expect(find.text('Confirmar'), findsOneWidget);
    });

    testWidgets('shows dialog on left arrow tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Galaxy(),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_left));
      await tester.pump(); // Atualiza o estado

      expect(find.byType(AlertDialog), findsOneWidget);
      expect(find.text('Aviso'), findsOneWidget);
      expect(find.text('Uma nova galáxia poderá ser visitada logo logo.'), findsOneWidget);
    });

    testWidgets('closes dialog on close button tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Galaxy(),
        ),
      );

      await tester.tap(find.byIcon(Icons.arrow_left));
      await tester.pump(); // Atualiza o estado

      await tester.tap(find.text('Fechar'));
      await tester.pump(); // Atualiza o estado

      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('navigates to Planets page on Confirm button tap', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Galaxy(),
        ),
      );

      await tester.tap(find.text('Confirmar'));
      await tester.pumpAndSettle(); // Atualiza o estado e espera transições

      expect(find.byType(Planets), findsOneWidget);
    });
  });
}
