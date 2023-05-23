import '../models/article.dart';
import '../service/api_service.dart';
import 'package:localstorage/localstorage.dart';

class Storage {
  static const String _file = "fakestoreapi.json";
  static const String _favKey = "fav_key";
  static const String _cartKey = "cart_key";
  static const String _userKey = "user_key";
  static final LocalStorage _storage = LocalStorage(_file);

  static Future<void> addUser(Map<String, dynamic> user) async {
    await _storage.ready;
    await _storage.setItem(_userKey, user);
  }

  static Future<void> delUser() async {
    await _storage.ready;
    await _storage.deleteItem(_userKey);
  }

  static Future<Map<String, dynamic>> getUser() async {
    await _storage.ready;
    return await _storage.getItem(_userKey) ?? {};
  }

  static Future<List<dynamic>> _getObject(String key) async {
    await _storage.ready;
    List idList = await _storage.getItem(key) ?? [];
    final List<Article> products = await APIService.getProducts();
    products.retainWhere((element) => idList.contains(element.id));
    return products;
  }

  static Future<void> _toggleObject(String key, dynamic value) async {
    await _storage.ready;
    List idList = await _storage.getItem(key) ?? [];
    if (idList.contains(value)) {
      idList.remove(value);
    } else {
      idList.add(value);
    }
    await _storage.setItem(key, idList);
  }

  static Future<bool> _isObject(String key, int productId) async {
    await _storage.ready;
    List idList = await _storage.getItem(key) ?? [];
    return idList.contains(productId);
  }

  /// Obtenir la liste des articles qui sont dans le Favorite en stockage local pour le user connecter
  static Future<List<Article>> getListFavoriteProdcut(int userId) async {
    return await _getObject("$userId$_favKey") as List<Article>;
  }

  static Future<void> toggleFavoriteProduct(
      int userId, dynamic productId) async {
    await _toggleObject("$userId$_favKey", productId);
  }

  static Future<bool> isProductFavorite(int userId, int productId) async {
    return await _isObject("$userId$_favKey", productId);
  }

  /// Obtenir la liste des articles qui sont dans le Panier en stockage local pour le user connecter
  static Future<List<Article>> getListCartsProduct(int userId) async {
    return await _getObject("$userId$_cartKey") as List<Article>;
  }

  static Future<void> toggleCartsProduct(int userId, dynamic productId) async {
    await _toggleObject("$userId$_cartKey", productId);
  }

  static Future<bool> isCartInProduct(int userId, int productId) async {
    return await _isObject("$userId$_cartKey", productId);
  }
}
