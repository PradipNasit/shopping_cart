import 'package:get/get.dart';
import 'package:shoping_cart/model/product_model.dart';

class MyCartController extends GetxController {
  List<ProductModel> myCartList = [];

  bool isProductsExits(int productId) {
    bool result = false;

    for (var product in myCartList) {
      if (product.id == productId) {
        result = true;
        break;
      } else {
        result = false;
      }
    }

    print(result);
    return result;
  }

  void addProduct(ProductModel product) {
    myCartList.add(product);
    update();
  }

  void removeProduct(int productId) {
    for (var product in myCartList) {
      if (product.id == productId) {
        myCartList.remove(product);
        update();
        break;
      }
    }
  }
}
