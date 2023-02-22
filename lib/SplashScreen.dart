import 'package:apiproject/HomePage.dart';
import 'package:apiproject/LoginPageApi.dart';
import 'package:apiproject/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.containsKey("islogin"))
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>HomePage())
      );
    }
    else
    {
      Navigator.of(context).pop();
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=>LoginPageApi())
      );
    }
  }
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500),(){
      checkdata();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("img/flut2.jpg",width: 200),
    );
  }
}
