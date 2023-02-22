import 'dart:convert';

import 'package:apiproject/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'models/User.dart';

class LoginPageApi extends StatefulWidget {
  @override
  State<LoginPageApi> createState() => _LoginPageApiState();
}

class _LoginPageApiState extends State<LoginPageApi> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page Api's "),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    hintText: 'Enter a Name'),
                controller: _name,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                obscureText: true,
                controller: _password,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              // child: ElevatedButton(
              //   onPressed: () async {
              //     SharedPreferences prefs = await SharedPreferences.getInstance();
              //     var name = _name.text.toString();
              //     var password = _password.text.toString();
              //
              //       Uri url = Uri.parse("https://begratefulapp.ca/api/login");
              //
              //       Map<String, String> params = {
              //         "name": name,
              //         "password": password,
              //         "device_token": "12345678",
              //         "device_os": "android"
              //       };
              //
              //       Map<String, String> header = {
              //         "Content-Type": "application/json",
              //       };
              //       var response = await http.post(url, body: jsonEncode(params), headers: header);
              //
              //     // SharedPreferences prefs = await SharedPreferences.getInstance();
              //
              //     if(name==password)
              //     {
              //       Navigator.of(context).pop();
              //       Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context)=>HomePage())
              //       );
              //     }
              //       // if (response.statusCode == 200) {
              //       //   var json = jsonDecode(response.body);
              //       //   if (json["result"] == "success") {
              //       //
              //       //     SharedPreferences prefs = await SharedPreferences.getInstance();
              //       //     prefs.setString("name", name);
              //       //     prefs.setString("password", password);
              //       //     Navigator.of(context).push(
              //       //         MaterialPageRoute(builder: (context) => HomePage())
              //       //     );
              //       //     print("Login Succefully");
              //       //      // SharedPreferences prefs = await SharedPreferences.getInstance();
              //       //     prefs.setString("islogin", "yes");
              //       //   }
              //       //   Fluttertoast.showToast(
              //       //       msg: "Your Name And Password is correct",
              //       //     toastLength: Toast.LENGTH_SHORT,
              //       //     gravity: ToastGravity.BOTTOM,
              //       //     backgroundColor: Colors.white,
              //       //     textColor: Colors.green,
              //       //   );
              //       //
              //       //   Navigator.of(context).pop();
              //       //   Navigator.of(context).push(
              //       //       MaterialPageRoute(builder: (context) => HomePage())
              //       //   );
              //       // }
              //       else {
              //         Fluttertoast.showToast(
              //           msg: "Enter valid Statement!!",
              //           toastLength: Toast.LENGTH_SHORT,
              //           gravity: ToastGravity.BOTTOM,
              //           backgroundColor: Colors.blue,
              //           textColor: Colors.red,
              //         );
              //         print("login failed");
              //       }
              //     },
              //   child: Text(
              //     'Login',style: TextStyle(color: Colors.white, fontSize: 25),
              //   ),
              // ),
              child: GestureDetector(
                  onTap : () async{

                    var name = _name.text.toString();
                    var password = _password.text.toString();

                    Uri url = Uri.parse("https://begratefulapp.ca/api/login");

                    Map<String,String> params = {
                      "name": name,
                      "password": password,
                      "device_token":"12345678",
                      "device_os":"android"
                    };

                    Map<String,String> headers = {
                      "Content-Type": "application/json",
                    };

                    var response = await http.post(url,body: jsonEncode(params),headers: headers);

                    if(response.statusCode==200)
                    {
                      var json = jsonDecode(response.body);
                      if(json["result"]=="success")
                      {


                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        User obj = User.fromJson(json["data"]);
                        prefs.setString("userdata", jsonEncode(obj));
                        // prefs.setString("name", name);
                        // prefs.setString("id", id);
                        // prefs.setString("email", email);
                        // prefs.setString("password", password);
                        prefs.setString("islogin", "yes");

                        Fluttertoast.showToast(
                            msg: "Your Name And Password is correct",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );

                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>HomePage())
                        );




                      }
                      else
                      {
                        Fluttertoast.showToast(
                            msg: "Your Name And Password is Incorrect",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    }
                  },
                  child: Center(child: Text("LOGIN",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),))
              ),
            ),
          ]
        ),
      ),
    );
  }
}








// Uri url = Uri.parse("https://begratefulapp.ca/api/login");
//
// Map<String,String> params = {
//   "name": name,
//   "password": password,
//   "device_token":"12345678",
//   "device_os":"android"
// };
//
// Map<String,String> header = {
//   "Content-Type":"application/json",
// };
//
//
// var response = await http.post(url,body: jsonEncode(params),headers: header);
// if(response.statusCode==200)
//   {
//     var json = jsonDecode(response.body);
//     if(json["result"]=="success")
//       {
//         var id = json["data"]["id"].toString();
//         var name = json["data"]["name"].toString();
//         var email = json["data"]["email"].toString();
//
//         //home
//       }
//     else
//       {
//         print("Login Failed!");
//       }
//   }
