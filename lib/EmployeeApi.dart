import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeeApi extends StatefulWidget {

  @override
  State<EmployeeApi> createState() => _EmployeeApiState();
}

class _EmployeeApiState extends State<EmployeeApi> {
  Future<List> alldata;

  Future<List>  fetchProducts() async{
    // get products -api   (get)
    Uri url= Uri.parse("http://picsyapps.com/studentapi/getEmployee.php");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
      var body = response.body.toString();
      var json = jsonDecode(body);
      return json["data"];
    }
    else
    {
      print("API Error");
    }
  }

  @override
  void initState() {
    super.initState();
    setState((){
      alldata =  fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee post"),
      ),
        body:  FutureBuilder(
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
                            child: Card(
                              elevation: 10,
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Colors.greenAccent,
                                    border: Border.all(color: Colors.black,width: 3
                                    )
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6.0,bottom: 10,),
                                      child: Text(Snapshots.data[index]["ename"].toString(),style: TextStyle(fontSize: 20),),
                                    ),
                                    Text(Snapshots.data[index]["salary"].toString()),
                                    Text(Snapshots.data[index]["department"].toString()),
                                    Text(Snapshots.data[index]["gender"].toString()),


                                  ],
                                ),
                              ),
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
        )
    );
  }
}
