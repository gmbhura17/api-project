import 'package:flutter/material.dart';

import 'ModelsAni/AnimalModule.dart';

class AnimalModule2 extends StatefulWidget {
  AnimalModule obj;

AnimalModule2({this.obj});
  @override
  State<AnimalModule2> createState() => _AnimalModule2State();
}

class _AnimalModule2State extends State<AnimalModule2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal View Page (2)"),
      ),
      body: Card(
        elevation: 10,
        child: Container(
          color: Colors.white30,
          height: 450,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 20,),
               Image.network(widget.obj.name,width: 200,),
               SizedBox(height: 20,),
               Text(widget.obj.latinName),
              SizedBox(height: 20,),
               Text(widget.obj.latinName),
              SizedBox(height: 20,),
               Text(widget.obj.geoRange),

            ],
          ),
        ),
      ),

    );
  }
}
