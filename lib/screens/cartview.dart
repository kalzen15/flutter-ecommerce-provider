import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/models/cart.dart';
import 'package:providercart/screens/confirm_screen.dart';

class Cartview extends StatefulWidget {
  @override
  _CartviewState createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  @override
  Widget build(BuildContext context) {
    var ccart = Provider.of<Cart>(context);

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
        body: ccart.cartItems.length == 0
            ? Center(child: Text('No items in your cart'))
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: ccart.cartItems.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading:
                                Image.network(ccart.cartItems[index].image),
                            title: Text(ccart.cartItems[index].title),
                            subtitle:
                                Text(ccart.cartItems[index].price.toString()),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                ccart.remove(ccart.cartItems[index]);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ConfirmPage())),
                    child: Text("Proceed"),
                  )
                ],
              ));
  }
}
