import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/models/login.dart';
import 'package:providercart/screens/login_screen.dart';

import '../models/cart.dart';
import '../productlistview.dart';
import 'cartview.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    var loginDetails = Provider.of<Login>(context);
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(
            child: GestureDetector(
              onTap: () {
                loginDetails.update("", "");
                loginDetails.saveLogin("", "");
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Logout"),
              ),
            ),
          ),
          appBar: AppBar(
            title: Text('Products'),
            actions: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Cartview()));
                      },
                    ),
                    Text(ccart.count.toString())
                  ],
                ),
              )
            ],
            centerTitle: true,
          ),
          body: Center(child: ProductListView())),
    );
  }
}
