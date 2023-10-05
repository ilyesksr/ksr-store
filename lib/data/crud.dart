import 'package:ksr_store_app/models/productCRUD.dart';
import 'package:http/http.dart' as http;

class CRUD {
  static Future<void> addProduct(ProductCRUD productCRUD) async {
    try {
      final response = await http.post(
          Uri.parse('https://fakestoreapi.com/products'),
          body: productCRUD.toJson());
      print(response.body);
    } catch (e) {
      print('from CRUD addProduct ${e.toString()}');
      rethrow;
    }
  }
}
