import 'package:focal2/core/servies/my_services.dart';
import 'package:focal2/main.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/product_model.dart';

class FavoriteController extends GetxController {
  List<ProductModel> favorites = [];

  @override
  void onInit() async{
    favorites!= await MyServices().getFavorite();
    super.onInit();
  }

  void addToFavorites(ProductModel product) {
    favorites.add(product);
    MyServices().saveFavorite(product);
    update();
  }

  void removeFromFavorites(ProductModel product) {
    favorites.removeWhere((product) => product.data.id == product.data.id);
    MyServices().saveFavorite(product);
    update();
  }

  bool isFavorite(int id) {
    return favorites.any((product) => product.data.id == id);
  }
}
