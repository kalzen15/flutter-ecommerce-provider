import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:providercart/models/product.dart';
import 'package:providercart/productlistview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends ChangeNotifier {
  List<Product> _products = [];

  dynamic _totalPrice = 0.0;

  void add(Product item) {
    _products.add(item);
    _totalPrice += item.price;
    notifyListeners();
  }

  void remove(Product item) {
    _totalPrice -= item.price;
    _products.remove(item);

    notifyListeners();
  }

  void removeAll() {
    _totalPrice = 0;
    _products = [];

    notifyListeners();
  }

  int get count {
    return _products.length;
  }

  dynamic get totalPrice {
    return _totalPrice;
  }

  List<Product> get cartItems {
    return _products;
  }
}
