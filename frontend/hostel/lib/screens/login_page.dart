import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/constants/constants.dart';
import 'package:hostel/screens/home_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class LoginPage extends StatefulWidget {
  

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String connectUrl="";
  
  Future<http.Response> sendInfo(String id,String password) async {

    final response = await http.post(
    Uri.parse('$baseurl/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'id':id,
      'password':password,
      // 'id':65.toString(),
      
    }),
    
  );
  return response;
 
  }
  
    
  
  TextEditingController id=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController token=TextEditingController();
  bool invalidCredentials=false;
  bool passVisibility=false;


  var vals = [
    Colors.green[100],
    Colors.green[100],
    Colors.green[100],
  ];
  void changeColor(int value) {
    for (int i = 0; i < 3; i++) {
      setState(() {
        if (i == value)
          vals[i] = Colors.green[50];
        else
          vals[i] = Colors.green[100];
      });
    }
  }


  @override

  
  
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.white,
      body: Container(
        padding:EdgeInsets.symmetric(horizontal: screenwidth*0.05),
        decoration: CommonGradient,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children: [
            SizedBox(height: screenheight*0.1,),
            CircleAvatar(
              // backgroundColor: Colors.grey[100],
              backgroundImage: AssetImage('assets/logo.png'),
              radius: screenheight*0.07,
            ),
            SizedBox(height:screenheight*0.08),
            Container(
              width:screenwidth*0.7,
              child:AutoSizeText(
                "WELCOME TO PSG",
                textAlign: TextAlign.center,
                presetFontSizes: [30,28,26,24,22,20],
                maxLines: 1,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )
            ),
            SizedBox(height: screenheight*0.05,),
            Container(
            width: screenwidth * 0.9,
            height:screenheight * 0.08,
            padding: EdgeInsets.symmetric(horizontal: screenwidth*0.02,),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenwidth*0.03,),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[50],
      
              ),
              child: TextField(
                style: TextStyle(
                  fontSize: screenheight * 0.025,
                ),
                controller: id,

                cursorColor: Colors.black,
                
                textAlign: TextAlign.left,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: screenheight*0.025),
                  
                  border:InputBorder.none,
                  hintText: "Login ID...",
                  hintStyle: TextStyle(
                    fontSize: screenheight*0.025
                  )
                ),
                // maxLines: null,
                // keyboardType: TextInputType.multiline,
                  
                ),
              ),
            ),
            SizedBox(height:screenheight*0.02),
            Container(
            width: screenwidth * 0.9,
            height: screenheight*0.08,
            
            padding: EdgeInsets.symmetric(horizontal: screenwidth*0.02,),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenwidth*0.03,),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[50],
      
              ),
              child: TextField(
                cursorColor: Colors.black,
                obscureText: !passVisibility,
                controller:password,
                style: TextStyle(
                  fontSize: screenheight*0.025
                  
                ),
      
                textAlign: TextAlign.left,
                
                decoration: InputDecoration(
                  suffixIcon: passVisibility ? InkWell(
                    onTap: (){
                      setState(() {
                        passVisibility=!passVisibility;
                      });
                      
                    },
                    child: Icon(
                      Icons.visibility,
                      color:Color(0xFF353740),
                      ),
                  ) 
                
                  : InkWell(
                    onTap: (){
                      setState(() {
                        passVisibility=!passVisibility;
                      });
                    },
                    child: Icon(
                      Icons.visibility_off,
                      color:Color(0xFF353740),
                      ),
                  ),
                  
                  
                  border:InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: screenheight*0.025),
                  hintText: "Enter password",
                  hintStyle: TextStyle(
                    fontSize: screenheight*0.025,
                  )
                  
                  
                  
                ),
                
                
              ),
            ),
          ),
          invalidCredentials ? Container(
            width:screenwidth*0.7,
            child:(
              AutoSizeText(
                "*Login ID or password do not match",
                presetFontSizes: [20,18,16,14],
                maxLines: 1,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color:Colors.red,
                )
              )
            )
          ) : SizedBox(height: 0,),

          SizedBox(height:screenheight * 0.04),

          Padding(
            padding: EdgeInsets.symmetric(horizontal:screenwidth*0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    changeColor(0);
                    setState(() {
                      connectUrl='student';
                      
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenheight*0.01,horizontal: screenwidth*0.01),
                    width:screenwidth*0.25,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:vals[0],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                      
                      
                
                    ),
                    child:AutoSizeText(
                      "Student",
                      textAlign: TextAlign.center,
                      presetFontSizes: [20,18,16,14],
                      maxLines: 1,
                    )
                  ),
                ),
                InkWell(
                  onTap : (){
                    changeColor(1);
                    setState(() {
                      connectUrl='helper';
                      
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenheight*0.01,horizontal: screenwidth*0.01),
                    width:screenwidth*0.25,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      color:vals[1],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ]
                            
                    ),
                    child:AutoSizeText(
                      "Helpers",
                      textAlign: TextAlign.center,
                      presetFontSizes: [20,18,16,14],
                      maxLines: 1,
                    )
                  ),
                ),
                InkWell(
                  onTap : (){
                    changeColor(2);
                    setState(() {
                      connectUrl='supervisor';
                      
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: screenheight*0.01,horizontal: screenwidth*0.01),
                    width:screenwidth*0.25,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      
                      color:vals[2],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ]
                
                    ),
                    child:AutoSizeText(
                      "Staff",
                      textAlign: TextAlign.center,
                      presetFontSizes: [20,18,16,14],
                      maxLines: 1,
                    )
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height:screenheight * 0.04),
          InkWell(
            onTap:() async {
              
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomePage()),
              // );
              
              // print(email.text);
              // print(password.text);
              http.Response response = await sendInfo(id.text, password.text);
              print(response.body);
              // print(response.statusCode);


              Map responseData=jsonDecode(response.body);
              // print(responseData['id']);
              // print(responseData['id']);
             
              
              
              

              
              
              if (responseData.containsKey('id')){
                final prefs=await SharedPreferences.getInstance();
                
                prefs.setString('userID',responseData['id']);
                print("Login Success");
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:(context)=>HomePage(
                      userID:responseData['id'],
                      type:responseData['type']
                    )
                    )
                  )
                );
                            
              }
              else {
                  
                  print(invalidCredentials);
                  setState(() {
                    invalidCredentials=true;
                    
                  });
              }
              
              // getInfo();
            },
            child: Container(
              width:screenwidth*0.9,
              height: screenheight*0.08,
              padding: EdgeInsets.symmetric(horizontal: screenwidth*0.01,vertical: screenheight*0.01),
              decoration: BoxDecoration(
                color:Color(0xFF353740),
                borderRadius: BorderRadius.circular(10),
              ),
              child:Center(
                child: AutoSizeText(
                  "Login",
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color:Colors.white,
                  ),
                  presetFontSizes: [24,22,20,18],
                ),
              )
            ),
          ),
          SizedBox(height:screenheight*0.02),
          InkWell(
            onTap :(){},
            child:Container(
              width:screenwidth*0.5,
              child: AutoSizeText(
                'Forgot Password?',
                textAlign: TextAlign.center,
                maxLines: 1,
                presetFontSizes: [22,20,18,16,14],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
            
          )
      
            
          
            
        
          ],
        )
      ),
    );
  }
}