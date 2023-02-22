import 'dart:convert';
import 'package:apiproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class ProductPostApi extends StatefulWidget {

  @override
  State<ProductPostApi> createState() => _ProductPostApiState();
}

class _ProductPostApiState extends State<ProductPostApi> {
  TextEditingController _product  = TextEditingController();
  TextEditingController _price  = TextEditingController();
  TextEditingController _quantity  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Insert Api ")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            // Text("Product :"),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                 controller: _product ,
                // obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Product',
                    hintText: 'Enter Your Product'
                ),
              ),

            ),
            SizedBox(
              height: 60,
            ),
            // Text("Price :"),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                 controller: _price,
                // obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Price',
                    hintText: 'Enter Your price'
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // Text("Quantity :"),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                 controller: _quantity ,
                // obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Quantity',
                    hintText: 'Enter your quantity'

                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () async{
                
                
                var name = _product.text.toString();
                var q = _quantity.text.toString();
                var p = _price.text.toString();
                // insert procduct normal -api  (post) ..1 product
                Uri url = Uri.parse("http://picsyapps.com/studentapi/insertProductNormal.php");

                Map<String,String> params = {
                  "pname":name,
                  "qty":q,
                  "price":p
                };

                var response = await http.post(url,body: params);
                if(response.statusCode==200)
                  {
                    var body = response.body.toString();
                    var json= jsonDecode(body);
                    if(json["status"]=="true")
                      {
                        var msg = json["message"];
                        print(msg);
                      }
                    else
                      {
                        print("Error");
                      }
                  }

                
                
                
                
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
