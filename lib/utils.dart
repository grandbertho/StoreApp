import 'package:flutter/material.dart';
import '../storage/storage.dart';

class UtilsTheme {
  static const TextStyle categoryTop = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.cyan,
  );

  static const TextStyle detailCategoryTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    // color:Colors.blue,
  );

  static const TextStyle titleDrawer =
      TextStyle(fontSize: 22, color: Colors.white);

  static const TextStyle desc = TextStyle(
    fontSize: 12,
  );

  static const TextStyle titleTopcategorie = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle titleStyleArticle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleHead =
      TextStyle(fontSize: 18, color: Colors.white);
}

class StateNotifier extends ChangeNotifier {
  MyAppState() {
    loadUserLocal();
  }

  Map<String, dynamic> _currentUser = {};

  bool isLogin() {
    if (_currentUser.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  // connect a user
  Future<void> login(Map<String, dynamic> currentUser) async {
    _currentUser = currentUser;
    await Storage.addUser(_currentUser);
    // avertir que le current user a changer
    notifyListeners();
  }

  Future<void> logout() async {
    _currentUser.clear();
    await Storage.delUser();
    notifyListeners();
  }

  Map<String, dynamic> getUser() {
    return _currentUser;
  }

  // changer user connecter en local
  Future<void> loadUserLocal() async {
    Map<String, dynamic> user = await Storage.getUser();
    login(user);
  }
}
