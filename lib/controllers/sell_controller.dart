import 'dart:async';

import 'package:dashui/global/data.dart';
import 'package:dashui/models/produit.dart';
import 'package:get/get.dart';

class SellController extends GetxController {
  static SellController instance = Get.find();

  var cartList = <Produit>[].obs;
  var cartTotal = 0.0.obs;

  Future<void> addItemToCart(String code) async {
    var product = products.where((s) => s.productCode == code).first;
    cartList.add(product);
    await initCartTotal();
  }

  Future<void> removeItemFromCart(String code) async {
    cartList.removeWhere((data) => data.productCode == code);
    await initCartTotal();
  }

  Future<void> removeAllFromCart() async {
    cartList.clear();
    await initCartTotal();
  }

  Future<void> initCartTotal() async {
    var totalCount = streamCounter();
    totalCount.listen((updatedTotal) {
      cartTotal.value = updatedTotal ?? 0;
    });
  }

  Stream<double> streamCounter() async* {
    double total = 0;
    var controller = StreamController<double>();
    Future.delayed(const Duration(milliseconds: 500), () {
      cartList.forEach((element) {
        double t = element.total;
        total += t;
      });
      controller.add(total);
    });
    yield* controller.stream;
  }
}
