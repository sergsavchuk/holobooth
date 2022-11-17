import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:io_photobooth/drawer_selection/drawer_selection.dart';
import 'package:io_photobooth/photo_booth/photo_booth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:photobooth_ui/photobooth_ui.dart';

import '../../helpers/helpers.dart';

class _MockDrawerSelectionBloc
    extends MockBloc<DrawerSelectionEvent, DrawerSelectionState>
    implements DrawerSelectionBloc {}

void main() {
  group('SelectionButtons', () {
    late DrawerSelectionBloc drawerSelectionBloc;

    setUp(() {
      drawerSelectionBloc = _MockDrawerSelectionBloc();
      when(() => drawerSelectionBloc.state).thenReturn(DrawerSelectionState());
    });

    testWidgets(
      'adds DrawerSelectionOptionSelected with DrawerOption.props '
      'clicking on props button',
      (WidgetTester tester) async {
        await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
        await tester.tap(find.byKey(SelectionButtons.propsSelectionButtonKey));
        verify(
          () => drawerSelectionBloc.add(
            DrawerSelectionOptionSelected(
              drawerOption: DrawerOption.props,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'adds DrawerSelectionOptionSelected with DrawerOption.characters '
      'clicking on characters button',
      (WidgetTester tester) async {
        await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
        await tester
            .tap(find.byKey(SelectionButtons.charactersSelectionButtonKey));
        verify(
          () => drawerSelectionBloc.add(
            DrawerSelectionOptionSelected(
              drawerOption: DrawerOption.characters,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
      'adds DrawerSelectionOptionSelected with DrawerOption.background '
      'clicking on background button',
      (WidgetTester tester) async {
        await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
        await tester
            .tap(find.byKey(SelectionButtons.backgroundSelectorButtonKey));
        verify(
          () => drawerSelectionBloc.add(
            DrawerSelectionOptionSelected(
              drawerOption: DrawerOption.backgrounds,
            ),
          ),
        ).called(1);
      },
    );

    testWidgets(
        'shows the characters bottomSheet when screen width is smaller '
        'than mobile breakpoint', (tester) async {
      whenListen(
        drawerSelectionBloc,
        Stream.value(
          DrawerSelectionState(drawerOption: DrawerOption.characters),
        ),
      );
      tester.setSmallDisplaySize();
      await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
      await tester.pumpAndSettle();
      expect(find.byType(ItemSelectorBottomSheet<Color>), findsOneWidget);
      expect(
        find.byKey(SelectionButtons.characterSelectionBottomSheetKey),
        findsOneWidget,
      );
    });

    testWidgets(
        'shows the backgrounds bottomSheet when screen width is smaller '
        'than mobile breakpoint', (tester) async {
      whenListen(
        drawerSelectionBloc,
        Stream.value(
          DrawerSelectionState(drawerOption: DrawerOption.backgrounds),
        ),
      );
      tester.setSmallDisplaySize();
      await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
      await tester.pumpAndSettle();
      expect(find.byType(ItemSelectorBottomSheet<Color>), findsOneWidget);
      expect(
        find.byKey(SelectionButtons.backgroundSelectionBottomSheetKey),
        findsOneWidget,
      );
    });

    testWidgets(
        'shows the props bottomSheet when screen width is smaller '
        'than mobile breakpoint', (tester) async {
      whenListen(
        drawerSelectionBloc,
        Stream.value(
          DrawerSelectionState(drawerOption: DrawerOption.props),
        ),
      );
      tester.setSmallDisplaySize();
      await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
      await tester.pumpAndSettle();
      expect(find.byType(ItemSelectorBottomSheet<Color>), findsOneWidget);
      expect(
        find.byKey(SelectionButtons.propsSelectionBottomSheetKey),
        findsOneWidget,
      );
    });

    testWidgets(
        'shows the characters drawer when screen width is greater '
        'than mobile breakpoint', (tester) async {
      whenListen(
        drawerSelectionBloc,
        Stream.value(
          DrawerSelectionState(drawerOption: DrawerOption.characters),
        ),
      );
      await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
      await tester.pumpAndSettle();

      expect(find.byType(DrawerLayer), findsOneWidget);
      expect(find.byKey(DrawerLayer.charactersDrawerKey), findsOneWidget);
    });

    testWidgets(
        'shows the props drawer when screen width is greater '
        'than mobile breakpoint', (tester) async {
      whenListen(
        drawerSelectionBloc,
        Stream.value(
          DrawerSelectionState(drawerOption: DrawerOption.props),
        ),
      );
      await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
      await tester.pumpAndSettle();

      expect(find.byType(DrawerLayer), findsOneWidget);
      expect(find.byKey(DrawerLayer.propsDrawerKey), findsOneWidget);
    });

    testWidgets(
        'shows the backgrounds drawer when screen width is greater '
        'than mobile breakpoint', (tester) async {
      whenListen(
        drawerSelectionBloc,
        Stream.value(
          DrawerSelectionState(drawerOption: DrawerOption.backgrounds),
        ),
      );
      await tester.pumpSubject(SelectionButtons(), drawerSelectionBloc);
      await tester.pumpAndSettle();

      expect(find.byType(DrawerLayer), findsOneWidget);
      expect(find.byKey(DrawerLayer.backgroundsDrawerKey), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpSubject(
    SelectionButtons subject,
    DrawerSelectionBloc drawerSelectionBloc,
  ) =>
      pumpApp(
        MultiBlocProvider(
          providers: [BlocProvider.value(value: drawerSelectionBloc)],
          child: Scaffold(
            endDrawer: DrawerLayer(),
            body: subject,
          ),
        ),
      );
}