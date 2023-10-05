import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider {
  static Future<List> getAllCategoriesName() async {
    try {
      final response = await http
          .get(Uri.parse('https://fakestoreapi.com/products/categories'));
      return jsonDecode(response.body);
    } catch (e) {
      print('from getAllCategoriesName ${e.toString()}');
      rethrow;
    }
  }

  static Future<List> getAllProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      return jsonDecode(response.body);
    } catch (e) {
      print('from getAllProducts ${e.toString()}');
      rethrow;
    }
  }

  static Future<List<dynamic>> getProductsOfSpecificCategory(
      String categoryName) async {
    try {
      final response = await http.get(Uri.parse(
          'https://fakestoreapi.com/products/category/$categoryName'));
      return jsonDecode(response.body);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
