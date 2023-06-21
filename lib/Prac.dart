import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Prac extends StatefulWidget {

  @override
  State<Prac> createState() => _PracState();
}

class _PracState extends State<Prac> {

  fetchProducts() async{
    Uri url= Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
    var body = response.body.toString();
    print(body);
    }
    else
    {
      print("API Error");
    }
  }
  @override
  void initState() {
    super.initState();
        fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Text("Tex"),

    );

  }
}
