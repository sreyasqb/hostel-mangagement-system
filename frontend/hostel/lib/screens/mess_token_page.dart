import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/components/food_card.dart';
import 'package:hostel/screens/home_page.dart' show height, width;
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/user_provider.dart';

class MessTokenPage extends StatefulWidget {
  int balance;

  MessTokenPage({required this.balance});

  @override
  State<MessTokenPage> createState() => _MessTokenPageState();
}

class _MessTokenPageState extends State<MessTokenPage> {
  DateTime date = DateTime.now();
  bool tokenBought=false;

  @override
  void initState() {
    checkTokenBought();
    super.initState();
  }

  void checkTokenBought() async{
    http.Response response = await http.get(
      Uri.parse("$baseurl/tokens"),
    );
    List tokenJson = jsonDecode(response.body);
    bool flag = false;
    for (Map token in tokenJson) {
      // print('${token["owner_id"]} ---- ${Provider.of<UserData>(context,listen:false).myUser.id}');
      if (token["owner_id"] == Provider.of<UserData>(context,listen:false).myUser.id) {
        flag = true;
        break;
      }
    }
    setState(() {
      tokenBought = flag;
    });
  }

  void buyToken(bool nonVeg) async {
    
    if (!tokenBought) {
      http.Response response = await http.post(Uri.parse('$baseurl/new/token'),
          headers: headers,
          body: jsonEncode({
            "id":102,
            "date":date.toString(),
            "owner":Provider.of<UserData>(context,listen:false).myUser.id,
            "non_veg":nonVeg
          }));
      Fluttertoast.showToast(
        msg: "You bought a token",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blueGrey[900],
        textColor: Colors.white,
        fontSize: 16.0
      );
      print(response.body);

    }
    else{
      print('failed');
      // Fluttertoast.showToast(msg: 'Failed');
      Fluttertoast.showToast(
        msg: "You have already bought a token",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
          height: height,
          width: width,
          decoration: CommonGradient,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.01),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                        height: height * 0.05,
                        child: AutoSizeText(
                          "Your Remaining Balance",
                          presetFontSizes: [30, 26, 22, 18],
                        )),
                    Container(
                        height: height * 0.05,
                        child: AutoSizeText(
                          "\u{20B9} ${widget.balance}",
                          presetFontSizes: [30, 26, 22, 18],
                        )),
                  ],
                ),
              ),
              SizedBox(height: height * 0.05),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodCard(
                        onPress: (){
                          buyToken(false);
                        },
                        date: date,
                        tokenBought: tokenBought,
                        title: "VEG TOKEN",
                        image: "assets/hot-pot.png",
                      ),
                      FoodCard(
                        onPress: () {
                          buyToken(true);
                        
                        },
                        date: date,
                        tokenBought: tokenBought,
                        title: "NON-VEG ",
                        image: "assets/chicken.png",
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     FoodCard(
                  //       onPress: () {},
                  //       date: date,
                  //       title: "OMLETTE",
                  //       image: "assets/omelette.png",
                  //     ),
                  //     FoodCard(
                  //       onPress: () {},
                  //       date: date,
                  //       title: "ROTI PANEER",
                  //       image: "assets/roti.png",
                  //     )
                  //   ],
                  // )
                ],
              )
            ],
          )),
    );
  }
}
