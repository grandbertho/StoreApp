import 'package:flutter/material.dart';
import '../utils.dart';
import '../_widget/_widget_product.dart';
import '../storage/storage.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    StateNotifier state = context.watch<StateNotifier>();
    if (state.isLogin()) {
      return ProductListWidget(getProducts: () {
        return Storage.getListCartsProduct(state.getUser()['id']);
      });
    } else {
      return ProductListWidget(getProducts: () {
        return Storage.getListCartsProduct(-1);
      });
    }
  }
}
