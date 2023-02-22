import 'package:apiproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _pin = TextEditingController();
  TextEditingController _conform = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign-In"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Enter PIN:"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: _pin,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text("Conform PIN :"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  controller: _conform,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 100,
              height: 50,
              child: GestureDetector(
                onTap: () async {
                  var pin = _pin.text.toString();
                  var conform = _conform.text.toString();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("pin", pin);
                  prefs.setString("conform", conform);
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Center(child: Text("LOGIN")),
              ),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
            ),
            SizedBox(
              height: 200.0,
            ),
            Center(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
