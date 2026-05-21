import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:provider/provider.dart';

class MyFavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final Product product;
  final double size;

  const MyFavoriteButton({
    super.key,
    required this.isFavorite,
    required this.product,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.read<ShopProvider>().toggleFavorite(product),
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        size: size,
        color: isFavorite
            ? Colors.red.shade400
            : Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
