import 'dart:convert';

import 'package:apiproject/AnimalApiList.dart';
import 'package:apiproject/AnimalViewModule.dart';
import 'package:apiproject/FakeApi.dart';
import 'package:apiproject/EmployeeApi.dart';
import 'package:apiproject/LoginPageApi.dart';
import 'package:apiproject/ProductPostApi.dart';
import 'package:apiproject/ProductApi.dart';
import 'package:apiproject/EmployeePostApi.dart';
import 'package:apiproject/ViewFakeProductModule.dart';
import 'package:apiproject/models/User.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  User obj;
  getdata()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState((){
      obj = User.fromJson(jsonDecode(prefs.getString("userdata")));
    });
  }
  @override
  void initState() {
    super.initState();
    setState((){
      getdata();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            children: [
            Text("Welcome  "+((obj==null)?"Guest":obj.name.toString())),
        Padding(
          padding: const EdgeInsets.only(left: 110.0),
          child: IconButton(
              onPressed: () {
                AlertDialog alert = new AlertDialog(
                  title: Center(child: Text("ALert !")),
                  content: Text("You Want To Logout !"),
                  actions: [
                    Row(
                      children: [
                        TextButton(onPressed: (){}, child: Text("Cancel")),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=> LoginPageApi())
                          );
                        }, child: Text("LogOut")),
                      ],
                    )
                  ],
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
                },
              icon: Icon(Icons.logout)),
        ),
        ]
      ),
    ),
      drawer: Drawer(

        backgroundColor: Colors.cyan.shade50,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 130.0),
            child: Column(children: [
              // Container(
              //   color: Colors.white,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.of(context).push(MaterialPageRoute(
              //             builder: (context) => Apiproject()));
              //       },
              //       style: ElevatedButton.styleFrom(
              //         shadowColor: Colors.black,
              //         shape: new RoundedRectangleBorder(
              //           // borderRadius: new BorderRadius.circular(30.0),
              //         ),
              //       ),
              //       child: Container(
              //
              //           child: Text("Fake Api List",style: TextStyle(color: Colors.black),))),
              // ),
              Container(
                height: 50,
                width: 100,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => FakeApi()));
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      "Fake Api List",
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                height: 50,
                width: 130,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AnimalApiList()));
                  },
                  child: Container(
                    color: Colors.yellowAccent,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                      "Animal Api List",
                      style: TextStyle(color: Colors.black),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),  Container(
                height: 50,
                width: 130,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductPostApi()));
                  },
                  child: Container(
                    color: Colors.cyan,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                          "Product Post Api ",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 150,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EmployeePostApi()));
                  },
                  child: Container(
                    color: Colors.cyan,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                          "Employee Post Api",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 130,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ProductApi()));
                  },
                  child: Container(
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                          "Product Api ...",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 50,
                width: 130,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EmployeeApi()));
                  },
                  child: Container(
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                          "Employee Api ...",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                height: 50,
                width: 190,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ViewFakeProductModule()));
                  },
                  child: Container(
                    color: Colors.white30,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                          "ViewFakeProduct-Module",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Container(
                height: 50,
                width: 190,
                decoration:
                BoxDecoration(border: Border.all(color: Colors.black)),
                child: GestureDetector(
                  onTap: () {
                    // setState(() {
                    // });
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => AnimalViewModule()));
                  },
                  child: Container(
                    color: Colors.greenAccent,
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Text(
                          "AnimalView-Module",
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

// SizedBox(height: 50,),
// Padding(
//   padding: const EdgeInsets.only(left: 100.0),
//   child: Row(
//     children: [
//       ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ViewStudent()));
//           },
//           style: ElevatedButton.styleFrom(
//             shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(30.0),
//             ),
//           ),
//           child: Text("View Student Data")),
//     ],
//   ),
// ),
// SizedBox(height: 50,),
// Padding(
//   padding: const EdgeInsets.only(left: 100),
//   child: Row(
//     children: [
//       ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ViewTeacher()));
//           },
//           style: ElevatedButton.styleFrom(
//             shape: new RoundedRectangleBorder(
//               borderRadius: new BorderRadius.circular(30.0),
//             ),
//           ),
//           child: Text("View Teachers Data")),
//     ],
//   ),
// ),
