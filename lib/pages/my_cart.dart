import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/controllers/mycart_controller.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key}) : super(key: key);

  var myCartController = Get.find<MyCartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MyCart")),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "${myCartController.myCartList[index].image}")),
              title: Text('${myCartController.myCartList[index].title}'),
            );
          },
          itemCount: myCartController.myCartList.length),
    );
  }
}
