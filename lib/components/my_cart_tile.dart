import 'package:flutter/material.dart';
import 'package:minimal_shop/models/product.dart';

class MyCartTile extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const MyCartTile({
    super.key,
    required this.product,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(10),
            child: Image.asset(product.imagePath, fit: BoxFit.contain),
          ),

          const SizedBox(width: 20),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                const SizedBox(height: 4),

                Text(
                  "Premium Fit",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 12),

                Text(
                  "\$${(product.price * quantity).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: colorScheme.tertiary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Row(
            children: [
              _buildQuantityButton(
                icon: Icons.remove,
                colorScheme: colorScheme,
                onTap: onDecrement, // 🔄 Mudado aqui
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),

              _buildQuantityButton(
                icon: Icons.add,
                colorScheme: colorScheme,
                isPrimaryColor: true,
                onTap: onIncrement,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required ColorScheme colorScheme,
    required VoidCallback onTap,
    bool isPrimaryColor = false,
  }) {
    final backgroundColor = isPrimaryColor
        ? const Color(0xFF059669)
        : colorScheme.primary;
    final iconColor = isPrimaryColor
        ? Colors.white
        : colorScheme.inversePrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 18, color: iconColor),
      ),
    );
  }
}
