import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_favorite_tile.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  //Remove Item From Favorite
  void removeItemFromFavorite(BuildContext context, Product product) {
    //Ask to user to remove
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your favorite?"),
        actions: [
          //Cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          //Confirm
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ShopProvider>().toggleFavorite(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    //Acess to favorites
    final favorites = context.watch<ShopProvider>().favorite;

    return Scaffold(
      backgroundColor: colorScheme.surface,

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: const Text("Favorites"),
      ),

      body: favorites.isEmpty
          ? const Center(child: Text("No favorites added yet..."))
          : Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 25),
              child: GridView.builder(
                itemCount: favorites.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: (context, index) {
                  final product = favorites[index];
                  return MyFavoriteTile(product: product);
                },
              ),
            ),
    );
  }
}
