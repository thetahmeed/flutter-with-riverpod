import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated2/state_notifier_provider3/providers/product_provider.dart';

class StateNotifierProviderPage3 extends ConsumerWidget {
  const StateNotifierProviderPage3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        title: const Text('My Products'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('All'),
                  onTap: () {
                    ref
                        .read(productProvider.notifier)
                        .onlyFavItems(onlyFav: false);
                  },
                ),
                PopupMenuItem(
                  child: const Text('Favourites'),
                  onTap: () {
                    ref.read(productProvider.notifier).onlyFavItems();
                  },
                ),
              ];
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SearchBar(
                elevation: const WidgetStatePropertyAll(0.1),
                onChanged: (value) {
                  ref.read(productProvider.notifier).searchProduct(value);
                },
              ),
              const SizedBox(height: 18),
              products.filteredProducts.isEmpty
                  ? const Center(
                      child: Text('No products found!'),
                    )
                  : ListView.builder(
                      itemCount: products.filteredProducts.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = products.filteredProducts[index];
                        return ListTile(
                          title: Text(item.title),
                          subtitle: Text('${item.price} Taka'),
                          trailing: IconButton(
                            onPressed: () {
                              ref
                                  .read(productProvider.notifier)
                                  .addFavourite(item.id, !item.isFavourite);
                            },
                            icon: Icon(
                              item.isFavourite
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_outline_rounded,
                            ),
                          ),
                        );
                      },
                    )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(productProvider.notifier).addProduct();
        },
        child: const Icon(
          Icons.add_rounded,
        ),
      ),
    );
  }
}
