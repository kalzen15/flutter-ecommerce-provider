import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/models/login.dart';
import 'package:providercart/productlistview.dart';
import 'package:providercart/models/cart.dart';
import 'package:providercart/screens/cartview.dart';
import 'package:providercart/screens/homepage.dart';
import 'package:providercart/screens/login_screen.dart';

void main() {
  runApp(MultiProvider(
    // create: (context) => Cart(),
    providers: [
      ChangeNotifierProvider(
        create: (context) => Cart(),
      ),
      ChangeNotifierProvider(
        create: (context) => Login(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loginDetails = Provider.of<Login>(context);
    loginDetails.getLogin();

    return MaterialApp(
      home: SafeArea(
          child: loginDetails.userName == "" ? LoginScreen() : HomePage()),
      debugShowCheckedModeBanner: false,
    );
  }
}
