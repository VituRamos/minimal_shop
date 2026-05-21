import 'package:flutter/widgets.dart';
import 'package:minimal_shop/models/product.dart';

class ShopProvider extends ChangeNotifier {
  //Products
  final List<Product> _shop = [
    Product(
      name: "Product 1",
      price: 99.99,
      description:
          "Detailed description of this premium item goes here. Perfect fit and premium quality material.",
      isFavorite: false,
      imagePath: 'lib/images/SNKRS1.png',
    ),

    Product(
      name: "Product 2",
      price: 99.99,
      description:
          "Detailed description of this premium item goes here. Perfect fit and premium quality material.",
      isFavorite: false,
      imagePath: 'lib/images/SNKRS2.png',
    ),

    Product(
      name: "Product 3",
      price: 99.99,
      description:
          "Detailed description of this premium item goes here. Perfect fit and premium quality material.",
      isFavorite: false,
      imagePath: 'lib/images/SNKRS3.png',
    ),

    Product(
      name: "Product 4",
      price: 99.99,
      description:
          "Detailed description of this premium item goes here. Perfect fit and premium quality material.",
      isFavorite: false,
      imagePath: 'lib/images/SNKRS4.png',
    ),
  ];

  //Cart
  final Map<Product, int> _cart = {};

  //Get Product
  List<Product> get shop => _shop;

  //Get Cart
  Map<Product, int> get cart => Map.unmodifiable(_cart);

  //Get Favorite
  List<Product> get favorite => _shop.where((p) => p.isFavorite).toList();

  int get cartItemCount =>
      _cart.values.fold<int>(0, (total, quantity) => total + quantity);

  Product _productFrom(Product item) =>
      _shop.firstWhere((p) => p.name == item.name);

  //Add Item To Cart
  void addToCart(Product item) {
    final product = _productFrom(item);
    _cart[product] = (_cart[product] ?? 0) + 1;
    notifyListeners();
  }

  //Remove Item To Cart
  void removeFromCart(Product item) {
    final product = _productFrom(item);
    if (!_cart.containsKey(product)) return;

    final quantity = (_cart[product] ?? 0) - 1;
    if (quantity <= 0) {
      _cart.remove(product);
    } else {
      _cart[product] = quantity;
    }
    notifyListeners();
  }

  //Cart Amount
  double get cartTotalAmount {
    double total = 0.0;
    _cart.forEach((product, quantity) {
      total += product.price * quantity;
    });
    return total;
  }

  //Clear Cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  // Toggle Item Favorite
  void toggleFavorite(Product item) {
    final product = _productFrom(item);
    product.isFavorite = !product.isFavorite;
    notifyListeners();
  }
}
