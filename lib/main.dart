import 'package:flutter/material.dart';
import 'package:minimal_shop/pages/details_page.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:minimal_shop/pages/cart_page.dart';
import 'package:minimal_shop/pages/favorite_page.dart';
import 'package:minimal_shop/pages/intro_page.dart';
import 'package:minimal_shop/pages/shop_page.dart';
import 'package:minimal_shop/providers/theme_provider.dart';
import 'package:minimal_shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ShopProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const AppRoot(),
    ),
  );
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: context.watch<ThemeProvider>().themeData,
      routes: {
        AppRoutes.IntroPage: (context) => const IntroPage(),
        AppRoutes.ShopPage: (context) => const ShopPage(),
        AppRoutes.CartPage: (context) => const CartPage(),
        AppRoutes.FavoritePage: (context) => const FavoritePage(),
        AppRoutes.DetailsPage: (context) => const DetailsPage(),
      },
    );
  }
}
