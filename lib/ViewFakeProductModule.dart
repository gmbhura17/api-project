import 'dart:convert';

          import 'package:apiproject/models/FakeProduct.dart';
    import 'package:flutter/material.dart';
    import 'package:http/http.dart' as http;

    class ViewFakeProductModule extends StatefulWidget {

    @override
    State<ViewFakeProductModule> createState() => _ViewFakeProductModuleState();
    }

    class _ViewFakeProductModuleState extends State<ViewFakeProductModule> {


    List<FakeProduct> alldata;

    fetchProducts() async
    {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
    {
    var body = response.body.toString();
    var json = jsonDecode(body);
    setState((){
    alldata = json.map<FakeProduct>((obj)=>FakeProduct.fromJson(obj)).toList();
    });
    //1.  all Json object read
    //2. json object to class object
    //3.  class objects list store
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
    title: Text("ViewFakeProduct Module "),
    ),
    body: (alldata!=null)?ListView.builder(
    itemCount: alldata.length,
    itemBuilder: (context,index)
    {
    return ListTile(
            leading: Image.network(alldata[index].image.toString()),
            title: Column(
              children: [
                Text(alldata[index].title.toString()),
                Text(alldata[index].price.toString()),
              ],
            ),
            subtitle: Text(alldata[index].rating.toString()),
          );
        },
      ):CircularProgressIndicator(),
    );
  }
}
