class Product {
  final String id;
  final String title;
  final double price;
  final bool isFavourite;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.isFavourite,
  });

  Product copyWith({
    String? id,
    String? title,
    double? price,
    bool? isFavourite,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
