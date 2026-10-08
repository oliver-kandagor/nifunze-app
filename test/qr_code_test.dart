import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nifunze/features/profile/presentation/widgets/qr_code_dialog.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  testWidgets('QRCodeDialog renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QRCodeDialog(
            name: 'Liam',
            username: '@liam',
            avatarUrl: 'assets/images/avatar/1.svg',
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(QrImageView), findsOneWidget);
  });
}
