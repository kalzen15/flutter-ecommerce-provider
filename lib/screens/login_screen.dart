import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providercart/models/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:providercart/screens/homepage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameFilter = new TextEditingController();
    final TextEditingController _phoneFilter = new TextEditingController();
    var loginDetails = Provider.of<Login>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Provider App"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: TextField(
                controller: _nameFilter,
                decoration: InputDecoration(labelText: 'Name'),
              ),
            ),
            Container(
              child: TextField(
                controller: _phoneFilter,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ),
            RaisedButton(
              onPressed: () {
                loginDetails.update(_nameFilter.text, _phoneFilter.text);
                loginDetails.saveLogin(_nameFilter.text, _phoneFilter.text);
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
