import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:io_photobooth/footer/footer.dart';
import 'package:photobooth_ui/photobooth_ui.dart';

import '../../helpers/helpers.dart';

void main() {
  group('FullFooter', () {
    testWidgets(
      'renders elements on small screen',
      (tester) async {
        tester.setSmallDisplaySize();
        await tester.pumpApp(FullFooter());
        expect(find.byType(FlutterIconLink), findsOneWidget);
        expect(find.byType(FirebaseIconLink), findsOneWidget);
        expect(find.byType(TensorflowIconLink), findsOneWidget);
      },
    );

    testWidgets(
      'renders elements on small screen when showIconsForSmall is false',
      (tester) async {
        tester.setSmallDisplaySize();
        await tester.pumpApp(FullFooter(showIconsForSmall: false));
        expect(find.byType(FlutterFooterLink), findsOneWidget);
        expect(find.byType(FirebaseFooterLink), findsOneWidget);
        expect(find.byType(TensorFlowFooterLink), findsOneWidget);
        expect(find.byType(MediapipeFooterLink), findsOneWidget);
        expect(find.byType(FooterTermsOfServiceLink), findsOneWidget);
        expect(find.byType(FooterPrivacyPolicyLink), findsOneWidget);
      },
    );

    testWidgets(
      'renders elements on large screen',
      (tester) async {
        tester.setDisplaySize(const Size(PhotoboothBreakpoints.large, 800));
        await tester.pumpApp(FullFooter());
        expect(find.byType(FlutterIconLink), findsOneWidget);
        expect(find.byType(FirebaseIconLink), findsOneWidget);
        expect(find.byType(TensorflowIconLink), findsOneWidget);
        expect(find.byType(FlutterFooterLink), findsOneWidget);
        expect(find.byType(FirebaseFooterLink), findsOneWidget);
        expect(find.byType(TensorFlowFooterLink), findsOneWidget);
        expect(find.byType(MediapipeFooterLink), findsOneWidget);
        expect(find.byType(FooterTermsOfServiceLink), findsOneWidget);
        expect(find.byType(FooterPrivacyPolicyLink), findsOneWidget);
      },
    );
  });
}