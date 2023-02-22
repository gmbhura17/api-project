import 'package:apiproject/AnimalApiList.dart';
import 'package:apiproject/AnimalViewModule.dart';
import 'package:apiproject/FakeApi.dart';
import 'package:apiproject/HomePage.dart';
import 'package:apiproject/LoginPageApi.dart';
import 'package:apiproject/SplashScreen.dart';
import 'package:flutter/material.dart';

import 'ViewFakeProductModule.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MyApi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  FakeApi(),
    );
  }
}
