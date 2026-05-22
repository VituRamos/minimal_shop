import 'package:flutter/material.dart';
import 'package:minimal_shop/components/my_button.dart';
import 'package:minimal_shop/components/my_cart_tile.dart';
import 'package:minimal_shop/models/product.dart';
import 'package:minimal_shop/providers/shop_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove this item from your cart?"),
        actions: [
          // Cancel
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          // Confirm
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ShopProvider>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context, double totalAmount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Confirm checkout'),
        content: Text('Total: \$${totalAmount.toStringAsFixed(2)}. Proceed?'),
        actions: [
          // Botão Cancelar
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              final messenger = ScaffoldMessenger.of(context);
              context.read<ShopProvider>().clearCart();
              Navigator.pop(dialogContext);
              messenger.showSnackBar(
                const SnackBar(
                  content: Text("Purchase completed successfully!"),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
            child: const Text('Pay'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cartEntries = context.watch<ShopProvider>().cart.entries.toList();
    final totalAmount = context.select<ShopProvider, double>(
      (shop) => shop.cartTotalAmount,
    );

    return Scaffold(
      backgroundColor: colorScheme.surface,

      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.inversePrimary,
        elevation: 0,
        centerTitle: true,
        title: const Text("Cart"),
      ),

      //Body
      body: Column(
        children: [
          //Expanded
          Expanded(
            child: cartEntries.isEmpty
                ? const Center(child: Text("Your cart is empty..."))
                : ListView.builder(
                    itemCount: cartEntries.length,
                    itemBuilder: (context, index) {
                      final entry = cartEntries[index];
                      final product = entry.key;
                      final quantity = entry.value;

                      return MyCartTile(
                        product: product,
                        quantity: quantity,
                        onDecrement: () {
                          if (quantity == 1) {
                            removeItemFromCart(context, product);
                          } else {
                            context.read<ShopProvider>().removeFromCart(
                              product,
                            );
                          }
                        },
                        onIncrement: () =>
                            context.read<ShopProvider>().addToCart(product),
                      );
                    },
                  ),
          ),

          if (cartEntries.isNotEmpty)
            Container(
              width: double.infinity,
              color: colorScheme.surface,
              child: SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total amount:",
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.inversePrimary,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "\$${totalAmount.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      MyButton(
                        onTap: () => payButtonPressed(context, totalAmount),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
