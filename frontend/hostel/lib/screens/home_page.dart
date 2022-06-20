import 'dart:convert';
import 'dart:ui';
import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/components/common_permission.dart';
import 'package:hostel/components/create_post.dart';
import 'package:hostel/components/food_card.dart';
import 'package:hostel/constants/constants.dart';
import 'package:hostel/models/user_model.dart';
import 'package:hostel/provider/user_provider.dart';
import 'package:hostel/screens/menu_page.dart';
import 'package:hostel/screens/mess_token_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

double height = 0, width = 0;
String id = "hi";
// UserModel user = UserModel(
//     name: "name",
//     rollNo: "rollNo",
//     roomNo: "roomNo",
//     type: "type",
//     id: "",
//     email: "");

class _HomePageState extends State<HomePage> {
  // File _image;

  String name = "Sreyas S", rollNo = "20PT33", roomNo = "B-522";
  int balance = 7640;

  // Provider.of(context).

  DateTime date = DateTime.now();
  DateTime today = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
  }

  bool loading = true;

  void getInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      id = prefs.getString('userID').toString();
    });
    http.Response response = await http.get(
      Uri.parse("$baseurl/user/20PT33"),
    );
    print(response.body);
    Map userJson = jsonDecode(response.body);
    Provider.of<UserData>(context, listen: false).setUserType(
        UserType.resident,
        Resident(
          name: userJson['name'],
          roomNo: 'B-523',
          id: userJson['id'],
          email: userJson["email"],
          phoneNo: userJson["phone_no"],
          department: 'amcs',
          course: 'cs',
        ));
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserData user = Provider.of<UserData>(context);
    // user.setUserType(UserType.resident, Resident(
    //   name: 'Sreyas',
    //   roomNo: 'B-522',
    //   id: '123',
    //   email: "s.shreyas303@gmail.com",
    //   phoneNo: "9886444150",
    //   department: 'amcs',
    //   course: 'cs',
    // ));
    

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Container(
        height: height,
        width:width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        decoration: CommonGradient,
        child: !loading
            ? Column(children: [
                SizedBox(height: height * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            print("notice");
                          },
                          child: Icon(
                            Icons.notifications_active,
                            size: height * 0.04,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              print("settings");
                            },
                            child: Icon(
                              Icons.settings,
                              size: height * 0.04,
                              color: Colors.blueGrey[900],
                            ))
                      ]),
                ),
                Stack(children: [
                  Container(
                      margin: EdgeInsets.only(top: height * 0.08),
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 0.05, vertical: height * 0.02),
                      height: height * 0.21,
                      decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            )
                          ]),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: height * 0.03,
                                    child: AutoSizeText(
                                      'Name',
                                      presetFontSizes: [26, 22, 18, 12],
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.35,
                                    child: AutoSizeText(
                                      user.myUser.name,
                                      presetFontSizes: [30, 26, 22, 18, 14],
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    height: height * 0.03,
                                    child: AutoSizeText(
                                      user.uType == UserType.resident
                                          ? "Roll No"
                                          : "Emp ID",
                                      presetFontSizes: [26, 22, 18, 12],
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.3,
                                    child: AutoSizeText(
                                      user.myUser.id,
                                      textAlign: TextAlign.right,
                                      presetFontSizes: [30, 26, 22, 18, 14],
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: height * 0.007),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: height * 0.03,
                                child: AutoSizeText(
                                  user.uType == UserType.supervisor
                                      ? "Block"
                                      : "Room No",
                                  presetFontSizes: [26, 22, 18, 12],
                                  style: TextStyle(
                                    color: Colors.blueGrey[900],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.3,
                                height: height * 0.05,
                                child: AutoSizeText(
                                  roomNo,
                                  textAlign: TextAlign.center,
                                  presetFontSizes: [30, 26, 22, 18, 14],
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  Align(
                      alignment: Alignment.topCenter,
                      child: CircleAvatar(
                        radius: height * 0.055,
                        backgroundColor: Colors.greenAccent,
                        child: CircleAvatar(
                          radius: height * 0.045,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      )),
                ]),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (user.uType == UserType.resident)
                      FoodCard(
                        date: date,
                        image: "assets/hot-pot.png",
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MessTokenPage(balance: balance)),
                          );
                          // print("tokens");
                        },
                        title: "MESS TOKENS",
                      ),
                    if (user.uType == UserType.resident)
                      FoodCard(
                        title: "Today's Menu",
                        date: today,
                        onPress: () {
                          // print("menu");
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MenuPage()),
                          );
                        },
                        image: "assets/menu.png",
                      )
                  ],
                ),
                SizedBox(height: height * 0.03),
                Container(
                  height: height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CommonPermission(
                          title: "WEEKEND PERMISSION",
                          onPress: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return BackdropFilter(
                                    filter:
                                        ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                    child: CreatePost(name: name),
                                  );
                                });
                          }),
                    ],
                  ),
                )
              ])
            : SpinKitWave(
              size:height*0.1,
              color: Colors.blueGrey[900],
            ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("scanner");
          },
          backgroundColor: Colors.blueGrey[900],
          child: Icon(
            Icons.qr_code,
            size: height * 0.04,
            color: Colors.white,
          )),
    );
  }
}

//user/type/




