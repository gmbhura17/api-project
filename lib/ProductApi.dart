import 'dart:convert';
import 'package:apiproject/UpdateProduct.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ProductApi extends StatefulWidget {

  @override
  State<ProductApi> createState() => _ProductApiState();
}

class _ProductApiState extends State<ProductApi> {

  Future<List> alldata;

  Future<List>  fetchProducts() async{
    // get products -api   (get)
    Uri url= Uri.parse("http://picsyapps.com/studentapi/getProducts.php");
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
        title: Text("product api's"),
      ),
      body:   FutureBuilder(
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
                     // return  homeScreenContainer(const Color(0xFFE2F5FF), "img/gro_strabery.png",Snapshots.data[index]["name"].toString()),;
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
                          child:Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6.0,bottom: 10,),
                                child: Text(Snapshots.data[index]["qty"].toString(),style: TextStyle(fontSize: 20),),
                              ),
                              Text(Snapshots.data[index]["price"].toString()),
                              Text(Snapshots.data[index]["pname"].toString()),

      //------------------ update Product --------------

                              SizedBox(
                                height: 30,
                              ),
                              Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      var id = Snapshots.data[index]["pid"].toString();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => UpdateProduct(
                                          updateid:id,
                                        ))
                                      );
                                    },
                                    child: Container(
                                        width: 110,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                          color: Colors.green[200],
                                        ),
                                        child: Center(child: Text("Update Product",style: TextStyle(),))
                                    ),
                                  ),

     //------------------ Delete Product --------------

                           GestureDetector(
                          onTap: ()  async{
                                var id = Snapshots.data[index]["pid"].toString();
                                // delete product normal (post) ..3
                                Uri url = Uri.parse("http://picsyapps.com/studentapi/deleteProductNormal.php");
                                Map<String,String> params = {
                                  "pid":id
                                };
                                var response = await http.post(url,body: params);
                                if(response.statusCode==200)
                                  {
                                    var json = jsonDecode(response.body);
                                    if(json["status"]=="true")
                                      {
                                        setState((){
                                          alldata =  fetchProducts();
                                        });
                                      }
                                    else
                                      {
                                        print("Not Delete");
                                      }
                                  }
                          },
                          child: Container(
                              width: 110,
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                color: Colors.green[400],
                              ),
                              child: Center(child: Text("Delete Product",style: TextStyle(),))),
                           ),
                                ],
                              ),
                            ],
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
