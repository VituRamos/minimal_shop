import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:minimal_shop/utils/app_routes.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  const MyProductTile({super.key, required this.product});

  final Product product;

  //Function add to cart button pressed
  void addToCart(BuildContext context) {
    //Ask to user to confirm
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add this item to your cart?"),
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
              context.read<ShopProvider>().addToCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = context.select<ShopProvider, bool>(
      (shop) => shop.shop
          .firstWhere((element) => element.name == product.name)
          .isFavorite,
    );

    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.DetailsPage,
        arguments: product,
      ),
      child: Container(
        width: 300,
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(25),
                      width: double.infinity,
                      child: Image.asset(product.imagePath),
                    ),
                  ),

                  const SizedBox(height: 25),

                  //Name
                  Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                  const SizedBox(height: 10),

                  //Description
                  Text(
                    product.description,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Price
                  Text('\$${product.price.toStringAsFixed(2)}'),

                  //Add to cart button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () => addToCart(context),
                          icon: Icon(Icons.add),
                        ),
                      ),

                      // Space between the buttons
                      const SizedBox(width: 12),

                      //Add to cart button
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () => context
                              .read<ShopProvider>()
                              .toggleFavorite(product),
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: isFavorite
                                ? Colors.red.shade400
                                : Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
