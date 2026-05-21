import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;

    final isFavorite = context.select<ShopProvider, bool>(
      (shop) => shop.shop
          .firstWhere((element) => element.name == product.name)
          .isFavorite,
    );

    return Scaffold(
      //App Bar
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        actions: [
          //Toggle theme
          IconButton(
            onPressed: () =>
                context.read<ShopProvider>().toggleFavorite(product),
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite
                  ? Colors.red.shade400
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),

      //Body
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Image
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(25),
                      width: double.infinity,
                      child: Image.asset(product.imagePath),
                    ),
                  ),

                  //Infos
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Product Name
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),

                            const SizedBox(width: 10),

                            //Product Price
                            Text(
                              "\$${product.price.toStringAsFixed(2)}",
                              style: TextStyle(
                                color: Theme.of(
                                  context,
                                ).colorScheme.inversePrimary,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        //Description
                        Text(
                          product.description,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Button add to cart
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25.0,
                  vertical: 20.0,
                ),
                child: MyButton(
                  onTap: () {
                    context.read<ShopProvider>().addToCart(product);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("${product.name} added to cart!")),
                    );
                  },
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
