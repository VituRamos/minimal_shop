import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_favorite_button.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:provider/provider.dart';

class MyFavoriteTile extends StatelessWidget {
  final Product product;

  const MyFavoriteTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final isFavorite = context.select<ShopProvider, bool>(
      (shop) => shop.shop
          .firstWhere((element) => element.name == product.name)
          .isFavorite,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: colorScheme
                      .primary, // Mudado para primary para contrastar com o fundo surface
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(product.imagePath, fit: BoxFit.contain),
              ),

              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  child: MyFavoriteButton(
                    size: 20,
                    isFavorite: isFavorite,
                    product: product,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),

        Text(
          product.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        const SizedBox(height: 2),

        Text(
          "\$${product.price.toStringAsFixed(2)}",
          style: TextStyle(
            color: colorScheme.tertiary,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
