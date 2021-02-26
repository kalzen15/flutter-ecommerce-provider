import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/models/login.dart';

import '../models/cart.dart';

class ConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);
    var loginDetails = Provider.of<Login>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart View [\$ ${ccart.totalPrice}]'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              ccart.removeAll();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ccart.cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(ccart.cartItems[index].image),
                    title: Text(ccart.cartItems[index].title),
                    subtitle: Text(ccart.cartItems[index].price.toString()),
                  ),
                );
              },
            ),
          ),
          Text("Total :\$ ${ccart.totalPrice}"),
          Text("Name : " + loginDetails.userName),
          Text("Phone :" + loginDetails.phoneNumber),
        ],
      ),
    );
  }
}
