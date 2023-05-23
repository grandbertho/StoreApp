import 'package:flutter/material.dart';
import '../service/api_service.dart';
import '../utils.dart';
import '../_widget/_widget_product.dart';
import '../_widget/_widget_category.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10,
          ),
          child: const Text("Featured Categories", style: UtilsTheme.categoryTop),
        ),
        const CategoryListWidget(getCategories: APIService.getTopCategories),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: const Text("Featured Products", style: UtilsTheme.categoryTop),
        ),
        const ProductListWidget(getProducts: APIService.getTopProducts),
      ],
    ));
  }
}
