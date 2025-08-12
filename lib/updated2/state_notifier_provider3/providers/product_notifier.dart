import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated2/state_notifier_provider3/models/my_products.dart';
import 'package:flutter_with_riverpod/updated2/state_notifier_provider3/models/product.dart';

class ProductNotifier extends StateNotifier<MyProducts> {
  ProductNotifier() : super(MyProducts(allProducts: [], filteredProducts: []));

  void addProduct() {
    final List<Product> fakeList = [
      Product(
        id: '0',
        title: 'iPhone',
        price: 200,
        isFavourite: false,
      ),
      Product(
        id: '1',
        title: 'Samsung',
        price: 100,
        isFavourite: false,
      ),
      Product(
        id: '2',
        title: 'Google',
        price: 110,
        isFavourite: false,
      ),
      Product(
        id: '3',
        title: 'Redmi',
        price: 40,
        isFavourite: false,
      ),
      Product(
        id: '4',
        title: 'Realme',
        price: 50,
        isFavourite: false,
      ),
      Product(
        id: '5',
        title: 'Nokia',
        price: 50,
        isFavourite: false,
      ),
    ];

    state = state.copyWith(
      allProducts: fakeList,
      filteredProducts: fakeList,
    );
  }

  void searchProduct(String query) {
    final filtered = state.allProducts.where(
      (element) => element.title.toLowerCase().contains(query.toLowerCase()),
    );
    state = state.copyWith(filteredProducts: filtered.toList());
  }

  void addFavourite(String id, bool statusUpdateTo) {
    final targetItemIndex1 =
        state.allProducts.indexWhere((element) => element.id == id);

    final targetItemIndex2 =
        state.filteredProducts.indexWhere((element) => element.id == id);

    state.allProducts[targetItemIndex1] = state.allProducts[targetItemIndex1]
        .copyWith(isFavourite: statusUpdateTo);

    state.filteredProducts[targetItemIndex2] = state
        .filteredProducts[targetItemIndex2]
        .copyWith(isFavourite: statusUpdateTo);

    state = state.copyWith(
      allProducts: state.allProducts,
      filteredProducts: state.filteredProducts,
    );
  }

  void onlyFavItems({bool onlyFav = true}) {
    if (onlyFav) {
      final onlyFav = state.allProducts.where((element) => element.isFavourite);
      state = state.copyWith(filteredProducts: onlyFav.toList());
    } else {
      state = state.copyWith(filteredProducts: state.allProducts);
    }
  }
}
