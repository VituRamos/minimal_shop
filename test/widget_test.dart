import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minimal_shop/main.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:minimal_shop/providers/theme_provider.dart';
import 'package:provider/provider.dart';

Future<void> pumpApp(WidgetTester tester) async {
  await tester.pumpWidget(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShopProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const AppRoot(),
    ),
  );
}

void main() {
  testWidgets('app loads intro page with title and navigation button',
      (tester) async {
    await pumpApp(tester);

    expect(find.text('Minimal Shop'), findsOneWidget);
    expect(find.text('Premium Quality Products'), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
  });

  testWidgets('intro page navigates to shop page', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.byIcon(Icons.arrow_forward));
    await tester.pumpAndSettle();

    expect(find.text('Shop Page'), findsOneWidget);
    expect(
      find.text('Pick from a selected list of premium products.'),
      findsOneWidget,
    );
  });
}
