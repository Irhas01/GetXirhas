import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_application_minggu_9/model/product.dart';
import 'package:get/get.dart';

class DemoController extends GetxController {
  var cartItems = <Product>[].obs;
  int get cartCount => cartItems.length;
  double get totalAmount => cartItems.fold(0.0, 
  (sum, element) => sum + element.price);
  //add the product
  addToCart(Product product) {
    cartItems.add(product);
  }

  final storage = GetStorage();
  bool get isDarkMode => storage.read('darkmode') ?? false;
  ThemeData get theme => isDarkMode ? ThemeData.dark() : ThemeData.light();
  void ChangeTheme (bool value) => storage.write('darkmode', val);
}