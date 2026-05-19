import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_badge.dart';
import 'package:minimal_shop/components/my_drawer.dart';
import 'package:minimal_shop/components/my_product_tile.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:minimal_shop/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ShopProvider>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: const Text("Shop Page"),
        actions: [
          //Toggle theme
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            },
            icon: Icon(
              context.watch<ThemeProvider>().isDarkMode
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),

          //Go to cart button
          MyBadge(
            value: context.watch<ShopProvider>().cart.length.toString(),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/cart_page'),
              icon: Icon(Icons.shopping_cart),
            ),
          ),
          //Toggle theme button
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),

      //Body
      body: ListView(
        children: [
          //Subtitle
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Pick from a selected list of premium products.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //Products
          SizedBox(
            height: 550,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.85),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: MyProductTile(product: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
