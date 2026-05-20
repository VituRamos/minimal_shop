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
  final List<Product> _cart = [];
  final List<Product> _favorite = [];

  //Get Product
  List<Product> get shop => _shop;

  //Get Cart
  List<Product> get cart => _cart;

  //Get Cart
  List<Product> get favorite => _favorite;

  //Add Item To Cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //Remove Item To Cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  // Toggle Item Favorite
  void toggleFavorite(Product item) {
    item.isFavorite = !item.isFavorite;
    item.isFavorite ? _favorite.add(item) : _favorite.remove(item);

    notifyListeners();
  }
}
