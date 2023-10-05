import 'package:ksr_store_app/data/dataProvider.dart';
import 'package:ksr_store_app/models/categoriesModel.dart';

import '../models/product.dart';

class Repository {
  static Future<List<CategoriesModel>> getAllCategories() {
    return DataProvider.getAllCategoriesName().then((value) => value
        .map((e) => CategoriesModel(
            categoryName: '$e'[0].toUpperCase() + '$e'.substring(1)))
        .toList());
  }

  static Future<List<Products>> getAllProducts() async {
    return await DataProvider.getAllProducts()
        .then((value) => value.map((e) => Products.fromJson(e)).toList());
  }

  static Future<List<Products>> getProductsOfSpecificCategory(
      String categoryName) {
    return DataProvider.getProductsOfSpecificCategory(categoryName)
        .then((value) => value.map((e) => Products.fromJson(e)).toList());
  }
}
