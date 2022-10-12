import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/controllers/home_page_controllers.dart';
import 'package:shoping_cart/pages/my_cart.dart';

import '../controllers/mycart_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeController = Get.put(HomeController());
    var myCartController = Get.put(MyCartController());

    return Scaffold(
      appBar: AppBar(title: const Text("Home"), actions: [
        IconButton(
            onPressed: () {
              Get.to(MyCart());
            },
            icon: Icon(Icons.add_shopping_cart_rounded))
      ]),
      body: Obx(() {
        if (!homeController.isLoading.value) {
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "${homeController.products[index].image}")),
                  title: Text('${homeController.products[index].title}'),
                  trailing: GetBuilder<MyCartController>(
                      builder: (MyCartController controller) {
                    return IconButton(
                        onPressed: () {
                          if (!controller.isProductsExits(
                              homeController.products[index].id)) {
                            myCartController
                                .addProduct(homeController.products[index]);
                          } else {
                            myCartController.removeProduct(
                                homeController.products[index].id);
                          }
                        },
                        icon: controller.isProductsExits(
                                homeController.products[index].id)
                            ? Icon(Icons.shopping_cart_rounded)
                            : Icon(Icons.shopping_cart_outlined));
                  }),
                );
              },
              itemCount: homeController.products.length);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
    );
  }
}
