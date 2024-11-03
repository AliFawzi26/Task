import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/product_model.dart';

class FavouriteController extends GetxController {
  //List<Map<String, dynamic>> favourites = [];
 /* final List<Map<String, dynamic>> Product= [
    {
      'id': 1,
      'image': 'assets/png/t_shirt2.png',
      'title': 'Programmer T-shirt',
      'price': 179.39,
      'isBestSeller': true,
    },
    {
      'id': 2,
      'image': 'assets/png/t_shirt3.png',
      'title': 'Designer T-shirt',
      'price': 159.99,
      'isBestSeller': true,
    },
    {
      'id': 3,
      'image': 'assets/png/t_shirt3.png',
      'title': 'Coder T-shirt',
      'price': 99.49,
      'isBestSeller': true,
    },
  ];*/
  // المنتجات المتاحة
  final List<Map<String, dynamic>> favourites = [
    {
      'id': 1,
      'image': 'assets/png/t_shirt2.png',
      'title': 'Programmer T-shirt',
      'price': 179.39,
      'isBestSeller': true,
    },
    {
      'id': 2,
      'image': 'assets/png/t_shirt3.png',
      'title': 'Designer T-shirt',
      'price': 159.99,
      'isBestSeller': true,
    },
    {
      'id': 3,
      'image': 'assets/png/t_shirt3.png',
      'title': 'Coder T-shirt',
      'price': 99.49,
      'isBestSeller': true,
    },
  ];

  @override
  void onInit() {
    super.onInit();
   // loadFavourites();
  }
/*
  void toggleFavourite(int id) async {
    if (isFavourite(id)) {
      removeFromFavourites(id);
    } else {
      addToFavourites(id);
    }
  }



  // إضافة المنتج إلى المفضلة
  void addToFavourites(int id) async {
    var item = products.firstWhere((product) => product['id'] == id, orElse: () => {});
    if (item.isNotEmpty && !favourites.any((favourite) => favourite['id'] == id)) {
      favourites.add(item);
      await saveFavourites();
      update();
    }
  }

  // إزالة المنتج من المفضلة
  void removeFromFavourites(int id) async {
    favourites.removeWhere((item) => item['id'] == id);
    await saveFavourites();
    update();
  }

  // التحقق من حالة المفضلة
  bool isFavourite(int id) {
    return favourites.any((item) => item['id'] == id);
  }

  // حفظ قائمة المفضلة
  Future<void> saveFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favIds = favourites.map((item) => item['id'].toString()).toList();
    await prefs.setStringList('favourites', favIds);
  }

  // تحميل قائمة المفضلة
  Future<void> loadFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? favIds = prefs.getStringList('favourites');
    if (favIds != null) {
      favourites = products.where((product) => favIds.contains(product['id'].toString())).toList();
      update();
    }
  }*/
}
