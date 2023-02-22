import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PrintApiExample extends StatefulWidget {

  @override
  State<PrintApiExample> createState() => _PrintApiExampleState();
}

class _PrintApiExampleState extends State<PrintApiExample> {
  fetchProducts() async{
    Uri url= Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      // var json = jsonDecode(body);
      // return json;
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
      appBar: AppBar(
        title: Text("Api Print Exampple "),
      ),
      body: Text("Test"),
    );
  }
}
