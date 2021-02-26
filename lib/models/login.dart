import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends ChangeNotifier {
  String name = "", phone = "";
  void update(String name, String phone) {
    this.name = name;
    this.phone = phone;
    notifyListeners();
  }

  String get userName {
    return name;
  }

  String get phoneNumber {
    return phone;
  }

  void getLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("name") != this.name)
      update(prefs.getString("name") ?? "", prefs.getString("phone") ?? "");
  }

  void saveLogin(String name, String phone) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("phone", phone);
  }
}
