import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EmployeePostApi extends StatefulWidget {

  @override
  State<EmployeePostApi> createState() => _EmployeePostApiState();
}

class _EmployeePostApiState extends State<EmployeePostApi> {
  var grpvalue = "Male";
  TextEditingController _name  = TextEditingController();
  TextEditingController _salary  = TextEditingController();
  TextEditingController _department= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Api Employee")
      ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           SizedBox(
             height: 60,
           ),
           Padding(
             padding: EdgeInsets.all(10),
             child: TextField(
               controller: _name ,
               // obscureText: true,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'E-name',
                   hintText: 'Enter Your name'
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
               controller: _department,
               // obscureText: true,
               keyboardType: TextInputType.text,
               decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Department',
                   hintText: 'Enter Your Department'
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
               controller: _salary,
               // obscureText: true,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                   border: OutlineInputBorder(),
                   labelText: 'Salary',
                   hintText: 'Enter Your Salary'
               ),
             ),
           ),    SizedBox(
             height: 60,
           ),
       Row(
         children: [
           Padding(
             padding: const EdgeInsets.only(left: 40.0),
             child: Text(
               "Gender :",
               style: TextStyle(fontSize: 20),
             ),
           ),
           SizedBox(
             width: 30,
           ),
           Text("Male :"),
           Radio(
               value: "Male",
               groupValue: grpvalue,
               onChanged: (val) {
                 setState(() {
                   grpvalue = (val);
                 });
               }),
           Text("Female :"),
           Radio(
               value: "Female",
               groupValue: grpvalue,
               onChanged: (val) {
                 setState(() {
                   grpvalue = (val);
                 });
               }),
             ],
            ),
           SizedBox(
             height: 50,
           ),
           GestureDetector(
             onTap: () async{


               var n = _name.text.toString();
               var d = _department.text.toString();
               var s = _salary.text.toString();
               var g = grpvalue.toString();
               // insert employee normal  -api  (post)..1 employee
               Uri url = Uri.parse("http://picsyapps.com/studentapi/insertEmployeeNormal.php");

               Map<String,String> params = {
                 "ename":n,
                 "salary":s,
                 "department":d,
                 "gender":g,
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
                   'Add',
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
