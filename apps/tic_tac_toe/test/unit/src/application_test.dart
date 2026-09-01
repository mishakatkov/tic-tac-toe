import 'package:app_providers/app_providers.dart';
import 'package:app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shouldly/shouldly.dart';

/// Long enough to cover the opponent's thinking time.
const _afterOpponentAnswered = Duration(seconds: 1);

Future<void> _pumpApp(WidgetTester tester) async {
  // The real composition: a forgotten DI contract blows up on the first build.
  await tester.pumpWidget(ProviderScope(overrides: appProviders(), child: const _TestApp()));
  await tester.pumpAndSettle();
}

/// The marks are painted, so they are counted by what a screen reader would read.
int _marksOf(String label) => find.bySemanticsLabel(label).evaluate().length;

void main() {
  testWidgets('the app starts on the board, with the player as crosses to move', (tester) async {
    await _pumpApp(tester);

    expect(tester.takeException(), isNull);
    find.text('Your turn').evaluate().length.should.be(1);
    find.text('You play').evaluate().length.should.be(1);
  });

  testWidgets('when the player plays a cell, the opponent answers', (tester) async {
    final semantics = tester.ensureSemantics();

    await _pumpApp(tester);

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();

    find.text('Computer is thinking').evaluate().length.should.be(1);

    await tester.pump(_afterOpponentAnswered);
    await tester.pumpAndSettle();

    find.text('Your turn').evaluate().length.should.be(1);
    // One mark in the side picker plus one on the grid, for each side.
    _marksOf('Cross').should.be(2);
    _marksOf('Circle').should.be(2);

    semantics.dispose();
  });

  testWidgets('the player can switch to circles, and the opponent opens', (tester) async {
    final semantics = tester.ensureSemantics();

    await _pumpApp(tester);

    // The grid is still empty, so the only circle on screen is the picker's.
    await tester.tap(find.bySemanticsLabel('Circle'));
    await tester.pump(_afterOpponentAnswered);
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    find.text('Your turn').evaluate().length.should.be(1);
    // The opponent opened with a cross: one in the picker, one on the grid.
    _marksOf('Cross').should.be(2);
    _marksOf('Circle').should.be(1);

    semantics.dispose();
  });

  testWidgets('the player can start a fresh round', (tester) async {
    await _pumpApp(tester);

    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump(_afterOpponentAnswered);
    await tester.pumpAndSettle();

    await tester.tap(find.text('Play again'));
    await tester.pumpAndSettle();

    find.text('Your turn').evaluate().length.should.be(1);
  });
}

class _TestApp extends ConsumerWidget {
  const _TestApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      MaterialApp.router(routerConfig: ref.watch(appRouterProvider).config());
}
