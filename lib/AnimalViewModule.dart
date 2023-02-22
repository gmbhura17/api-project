import 'dart:convert';

import 'package:apiproject/AnimalModule2.dart';
import 'package:apiproject/ModelsAni/AnimalModule.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AnimalViewModule extends StatefulWidget {
  @override
  State<AnimalViewModule> createState() => _AnimalViewModuleState();
}

class _AnimalViewModuleState extends State<AnimalViewModule> {
  List<AnimalModule> alldata;

  fetchProducts() async{
    Uri url= Uri.parse("https://zoo-animal-api.herokuapp.com/animals/rand/10");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      setState((){
        alldata = json.map<AnimalModule>((obj)=>AnimalModule.fromJson(obj)).toList();
      });
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
        title: Text("Animal View Module list"),
      ),
        body: (alldata!=null)?ListView.builder(
          itemCount: alldata.length,
          itemBuilder: (context,index)
          {
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=> AnimalModule2(obj: alldata[index],))
                );
              },
              child: Card(
                elevation: 10,
                child: Container(
                 color: Colors.white30,
                 height: 345,
                 width: 200,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),

                      CircleAvatar(
                          child: Image.network(alldata[index].imageLink.toString()),
                        backgroundColor: Colors.transparent,
                        radius: 70,
                      ),

                      SizedBox(height: 20,),
                      Text(alldata[index].habitat.toString(),style: TextStyle(fontSize: 25),),
                      SizedBox(height: 20,),
                      Text(alldata[index].diet.toString()),
                      SizedBox(height: 20,),
                      Text(alldata[index].lifespan.toString(),style: TextStyle(fontSize: 25),),



                    ],
                  ),
                ),
              ),
            );
          },
        ):CircularProgressIndicator(),
    );
  }
}
