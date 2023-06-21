import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Prac2 extends StatefulWidget {

  @override
  State<Prac2> createState() => _Prac2State();
}

class _Prac2State extends State<Prac2> {

  Future<List> alldata;
  Future<List> fetchProducts() async{
    Uri url= Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      return json;
      //print(body);
    }
    else
    {
      print("API Error");
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      alldata = fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: FutureBuilder(
 future: alldata,
    builder: (context,Snapshots)
    {
      if(Snapshots.hasData){
        if(Snapshots.data.length<=0){
          return Center(
            child: Text("No Data Found . . 404"),
          );
        }
        else{
          return ListView.builder(
              itemCount: Snapshots.data.length,
              itemBuilder: (context,index)
              {
                return Card(
                  elevation: 10,
                  child: Container(

                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        border: Border.all(color: Colors.black,width: 3
                        )
                    ),
                    child: ListTile(

                      leading:Image.network(Snapshots.data[index]["image"].toString()),
                      // Container(
                      //     height: 180,
                      //     width: 90,
                      //     decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.black,width: 1
                      //         )
                      //     ),
                      //     child: Image.network(Snapshots.data[index]["image_link"].toString())),
                      title: Text(Snapshots.data[index]["title"].toString()),
                      subtitle: Text(Snapshots.data[index]["price"].toString()),
                      // title: Padding(
                      //   padding: const EdgeInsets.only(left: 30.0),
                      //   child: Text(Snapshots.data[index]["name"].toString()),
                      // ),

                      // title: Center(
                      //   child: Column(
                      //     children: [
                      //       Padding(
                      //         padding: const EdgeInsets.only(top: 6.0,bottom: 10,),
                      //         child: Text(Snapshots.data[index]["name"].toString(),style: TextStyle(fontSize: 20),),
                      //       ),
                      //       Text(Snapshots.data[index]["habitat"].toString()),
                      //       Text(Snapshots.data[index]["geo_range"].toString()),
                      //       Text(Snapshots.data[index]["lifespan"].toString()),
                      //       Text(Snapshots.data[index]["animal_type"].toString()),
                      //       Text(Snapshots.data[index]["latin_name"].toString()),
                      //       Text(Snapshots.data[index]["length_min"].toString()),
                      //
                      //     ],
                      //   ),
                      // ),
                    ),
                  ),
                );
              }
          );
        }
      }
      else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    }
),
    );
  }
}
