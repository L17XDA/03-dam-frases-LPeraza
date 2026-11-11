// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frasesapp/models/frase.dart';
import 'package:frasesapp/screens/formulario_screen.dart';

void main() {
  test('Frase.fromMap reads the phrase, author, and id columns', () {
    final frase = Frase.fromMap({
      'id': 7,
      'frase': 'Sigue adelante',
      'autor': 'Anónimo',
    });

    expect(frase.id, 7);
    expect(frase.frase, 'Sigue adelante');
    expect(frase.autor, 'Anónimo');
  });

  testWidgets('save button validates required fields', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: FormularioScreen()));

    await tester.tap(find.text('Guardar Frase'));
    await tester.pumpAndSettle();

    expect(find.text('Escribe al menos 5 caracteres'), findsOneWidget);
    expect(find.text('Escribe el autor'), findsOneWidget);
  });
}
