import 'package:flutter/material.dart';
import '../../models/article.dart';
import '../../_widget/_widget_btn.dart';
import 'package:provider/provider.dart';
import '../../utils.dart';

class ProductDetail extends StatelessWidget {
  final Article article;
  const ProductDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    StateNotifier state = context.watch<StateNotifier>();
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              article.image,
              width: double.infinity,
              height: 200,
              alignment: Alignment.center,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(children: [
                const SizedBox(
                  height: 16,
                ),
                Text(
                  " ${article.title}",
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  article.description,
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Price: ${article.price}\$',
                  style: const TextStyle(
                    fontSize: 22,
                  ),
                ),
                state.isLogin() ? WidgetButton(userId: state.getUser()['id'], productId: article.id) : WidgetButton(userId: -1, productId: article.id)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
