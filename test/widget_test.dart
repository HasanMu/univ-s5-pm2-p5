import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:first_application/main.dart';

void main() {
  testWidgets('halaman Ruang Belajar menampilkan konten utama', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(456, 938);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Ruang Belajar'), findsOneWidget);
    expect(find.text('Halo, Hasan'), findsOneWidget);
    expect(find.text('Materi selesai'), findsOneWidget);
    expect(find.text('6j 40m'), findsOneWidget);
    expect(find.text('Mengenal Widget Dasar'), findsOneWidget);
    expect(find.text('Bab 3  •  68% selesai'), findsOneWidget);
    expect(find.text('4 dari 6 materi'), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsNWidgets(2));
    expect(tester.takeException(), isNull);
  });
}
