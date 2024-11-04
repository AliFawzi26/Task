import 'dart:convert';

import 'package:focal2/model/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/user_model.dart';

import '../const_data/const_data.dart';

class MyServices extends GetxService {
  static late SharedPreferences shared;

  Future<MyServices> initialize() async {
    shared = await SharedPreferences.getInstance();
    ProductModel? favorite = await getFavorite();

    if (favorite != null) {
      ConstData.favorite = favorite;
    } else {
      print('User info is null, handle accordingly');
    }
    ;

    return this;
  }

  static Future<void> saveValue(String key, String value) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    } catch (e) {
      print("Error saving value: $e");
    }
  }

  static getValue(String key) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    } catch (e) {
      print("Error getting value: $e");
      return null;
    }
  }

  Future<UserModel?> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString('user');

    if (userJson != null && userJson.isNotEmpty) {
      return UserModel.fromJson(jsonDecode(userJson));
    }

    return null;
  }

  Future<ProductModel?> getFavorite() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? favoriteJson = prefs.getString('favorite');

    if (favoriteJson != null && favoriteJson.isNotEmpty) {
      return ProductModel.fromJson(jsonDecode(favoriteJson));
    }

    return null;
  }

  Future<void> saveFavorite(ProductModel favorite) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String favoriteJson = jsonEncode(favorite.toJson());

      await prefs.setString('favorite', favoriteJson);
      print(' favorite is ......');
      print(favorite);
    } catch (e) {
      print("Error saving favorite info: $e");
    }
  }

  Future<void> saveUserInfo(UserModel user) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String userJson = jsonEncode(user.toJson());

      await prefs.setString('user', userJson);
      print(' user is ......');
      print(user);
    } catch (e) {
      print("Error saving user info: $e");
    }
  }

  Future<void> clear() async {
    try {
      await shared.clear();
      ConstData.token = '';

      print("All shared preferences cleared");
    } catch (e) {
      print("Error clearing shared preferences: $e");
    }
  }
}

Future<void> intialService() async {
  await Get.putAsync(() => MyServices().initialize());
}
