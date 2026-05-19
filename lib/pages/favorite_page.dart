import 'package:flutter/material.dart';
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
    //Acess to favorites
    final favorites = context.watch<ShopProvider>().favorite;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: const Text("Favorites Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //Favorite List
          Expanded(
            child: favorites.isEmpty
                ? Center(child: const Text("Your favorites is empty..."))
                : ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      //Get individual item in Favorite
                      final item = favorites[index];

                      //Return as a Favorite tile
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              onPressed: () {
                                context.read<ShopProvider>().addToCart(item);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${item.name} added to cart!",
                                    ),
                                  ),
                                );
                              },
                            ),

                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () =>
                                  removeItemFromFavorite(context, item),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
