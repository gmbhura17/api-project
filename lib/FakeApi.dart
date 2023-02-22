import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeApi extends StatefulWidget {

  @override
  State<FakeApi> createState() => _FakeApiState();
}

class _FakeApiState extends State<FakeApi> {


  Future<List> alldata;

  Future<List> fetchProducts() async
  {
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
      {
        var body = response.body.toString();
        var json = jsonDecode(body);
        return json;
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
        backgroundColor: Colors.black,
        title: Center(child: Text("Api Page 1",)),
      ),
      body: FutureBuilder(
        future: alldata,
        builder: (context,snapshots)
        {
          if(snapshots.hasData)
            {
              if(snapshots.data.length<=0)
                {
                  return Center(
                    child: Text("No Data"),
                  );
                }
              else
                {
                  return ListView.builder(
                    itemCount: snapshots.data.length,
                    itemBuilder: (context,index)
                    {
                      return ListTile(
                        leading: Image.network(snapshots.data[index]["image"].toString()),
                        title: Column(
                          children: [
                            Text(snapshots.data[index]["title"].toString()),
                            Text(snapshots.data[index]["price"].toString()),
                          ],
                        ),
                        subtitle: Text(snapshots.data[index]["rating"]["rate"].toString()),
                      );
                    },
                  );
                }
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
    );
  }
}
