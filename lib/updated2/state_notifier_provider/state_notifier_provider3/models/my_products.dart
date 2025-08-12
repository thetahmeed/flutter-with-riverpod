// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_with_riverpod/updated2/state_notifier_provider/state_notifier_provider3/models/product.dart';

class MyProducts {
  final List<Product> allProducts;
  final List<Product> filteredProducts;

  MyProducts({
    required this.allProducts,
    required this.filteredProducts,
  });

  MyProducts copyWith({
    List<Product>? allProducts,
    List<Product>? filteredProducts,
  }) {
    return MyProducts(
      allProducts: allProducts ?? this.allProducts,
      filteredProducts: filteredProducts ?? this.filteredProducts,
    );
  }
}
