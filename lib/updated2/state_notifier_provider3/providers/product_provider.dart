import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_with_riverpod/updated2/state_notifier_provider3/models/my_products.dart';
import 'package:flutter_with_riverpod/updated2/state_notifier_provider3/providers/product_notifier.dart';

final productProvider = StateNotifierProvider<ProductNotifier, MyProducts>(
    (ref) => ProductNotifier());
