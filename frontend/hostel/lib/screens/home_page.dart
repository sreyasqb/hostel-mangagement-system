import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/components/common_permission.dart';
import 'package:hostel/components/food_card.dart';
import 'package:hostel/screens/menu_page.dart';
import 'package:hostel/screens/mess_token_page.dart';


class HomePage extends StatefulWidget {
  

  @override
  _HomePageState createState() => _HomePageState();
}
double screenheight=0,screenwidth=0;
class _HomePageState extends State<HomePage> {
  String name="Sreyas S",rollNo="20PT33",roomNo="B-522";

  
  DateTime date=DateTime.now();
  DateTime today=DateTime.now();
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      
      // backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenwidth*0.03),
        decoration: CommonGradient,
        child:Column(
          children: [
            SizedBox(height:screenheight*0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenwidth*0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children : [
                  InkWell(
                    onTap: (){
                      print("notice");
                    },
                    child: Icon(
                      Icons.notifications_active,
                      size: screenheight*0.04,
                      color:Colors.blueGrey[900],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      print("settings");
                    },
                    child: Icon(
                      Icons.settings,
                      size: screenheight*0.04,
                      color:Colors.blueGrey[900],
                    )
                    
                  )
                ]
              ),
            ),
            Stack(
              children: [
                
                Container(
                  margin: EdgeInsets.only(top: screenheight*0.08),
                  padding: EdgeInsets.symmetric(horizontal: screenwidth*0.05,vertical:screenheight*0.02),
                   height: screenheight*0.21,
                   decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ]
                  
                  ),
                  child:Column(
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height:screenheight*0.03,
                                child: AutoSizeText(
                                  "Name",
                                  presetFontSizes: [26,22,18,12],
                                  style: TextStyle(
                                    color:Colors.blueGrey[900],
                                  ),
                                ),
                              ),
                              Container(
                                width: screenwidth*0.35,
                                child: AutoSizeText(
                                  name,
                                  presetFontSizes: [30,26,22,18,14],
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
                                height:screenheight*0.03,
                                child: AutoSizeText(
                                  "Roll No",
                                  presetFontSizes: [26,22,18,12],
                                  style: TextStyle(
                                    color:Colors.blueGrey[900],
                                  ),
                                ),
                              ),
                              Container(
                                width: screenwidth*0.3,
                                child: AutoSizeText(
                                  
                                  rollNo,
                                  textAlign: TextAlign.right,
                                  presetFontSizes: [30,26,22,18,14],
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
                      SizedBox(height:screenheight*0.007),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height:screenheight*0.03,
                            child: AutoSizeText(
                              "Room No",
                              presetFontSizes: [26,22,18,12],
                              style: TextStyle(
                                color:Colors.blueGrey[900],
                              ),
                            ),
                          ),
                          Container(
                            width: screenwidth*0.3,
                            height: screenheight*0.05,
                            child: AutoSizeText(
                              
                              roomNo,
                              textAlign: TextAlign.center,
                              
                              presetFontSizes: [30,26,22,18,14],
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                          ),
                        ],
                      )
                      
                      
                    ],
                  )
                ),
                Align(
                  alignment: Alignment.topCenter,
                child: CircleAvatar(
                  radius: screenheight*0.055,
                  backgroundColor: Colors.greenAccent,
                  child: CircleAvatar(
                    radius: screenheight*0.045,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                )
              ),
              ]
            ),
            
            SizedBox(height:screenheight*0.05),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FoodCard(date: date,
                  image:"assets/hot-pot.png",
                  onPress: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessTokenPage()),
                    );
                    // print("tokens");
                  },
                  title:"MESS TOKENS",
                ),
                FoodCard(
                  title:"Today's Menu",
                  date:today,
                  onPress: (){
                    // print("menu");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuPage()),
                    );
                    
                  },
                  image:"assets/menu.png",
                )
              ],
            ),
            SizedBox(height:screenheight*0.03),
            Container(
              height: screenheight*0.26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonPermission(
                    title:"WEEKEND PERMISSION",
                    onPress: (){
                      print("weekend");
                    }
                  ),
                  CommonPermission(
                    title:"DELAY PERMISSION",
                    onPress: (){
                      print("delay");
                    }
                  ),
                  CommonPermission(
                    title:"ROOM ALLOCATION",
                    onPress: (){
                      print("room allocation");
                    }
                  ),
                  
                ],
              ),
            )
          ]
        ),

          
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          print("scanner");
        },
        backgroundColor: Colors.blueGrey[900],
        child:Icon(
          Icons.qr_code,
          size: screenheight*0.04,
          color:Colors.white,
        )
      ),
    );
  }
}


