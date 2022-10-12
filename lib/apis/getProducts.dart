import 'package:shoping_cart/model/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> getProducts() async {
  http.Response response =
      await http.get(Uri.parse('https://fakestoreapi.com/products'));
  return productModelFromJson(response.body);
}
