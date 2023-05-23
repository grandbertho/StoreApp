import 'package:flutter/material.dart';
import '../../pages/payment_page.dart';

import '/utils.dart';
import '../../_widget/_widget_product.dart';
import '../../service/api_service.dart';

class CategoryDetail extends StatelessWidget {
  final String category;
  const CategoryDetail({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.toUpperCase()),
      actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const PayementPage()));
              },
              child: const Icon(Icons.payment

              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
        //   Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: Text(category, style: UtilsTheme.detailCategoryTitle),
        //   ),
          ProductListWidget(getProducts: () {
            return APIService.getProductsByCategory(category);
          }),
        ],
      )),
    );
  }
}
