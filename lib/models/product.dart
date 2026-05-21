class Product {
  final String id;
  final String name;
  final double price;
  final String description;
  bool isFavorite;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isFavorite,
    required this.imagePath,
  });
}
