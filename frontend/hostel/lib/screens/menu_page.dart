import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/screens/home_page.dart' show screenheight,screenwidth;

List <String> breakfast=['omlette','pongal','sambar','maggi',"coffee"];
List <String> lunch=['rasam','rice','sambar','curd','chicken'];
List <String> dinner=['rasam', 'dosa','sambar','rice','curdrice'];



class MenuPage extends StatefulWidget {
  

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenheight,
        width: screenwidth,
        decoration: CommonGradient,

        child:SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: screenheight*0.07,),
                  Column(
                    children: [
                      Container(
                        height: screenheight*0.03,
                        child:AutoSizeText(
                          "Breakfast",
                          presetFontSizes: [30,26,22,18,14],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          
                        )
                      ),
                      Container(
                        height: screenheight*0.02,
                        child:AutoSizeText(
                          "7 AM - 9:30 PM",
                          presetFontSizes: [26,22,18,14],
                          
                        )
                      ),
                      SizedBox(height:screenheight*0.02),
                      Container(
                        height: screenheight*0.25,
                        width:screenwidth*0.8,
                        padding: EdgeInsets.symmetric(vertical:screenheight*0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color:Colors.green[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              )
                            ]
                          ),
                        child: Column(
                          children: breakfast.map((item) {
                            return Container(
                              height: screenheight*0.04,
                              child: AutoSizeText(
                                "• $item",
                                presetFontSizes: [22,20,18,16,14],
                              ),
        
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:screenheight*0.03),
                  Column(
                    children: [
                      Container(
                        height: screenheight*0.03,
                        child:AutoSizeText(
                          "Lunch",
                          presetFontSizes: [30,26,22,18,14],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          
                        )
                      ),
                      Container(
                        height: screenheight*0.02,
                        child:AutoSizeText(
                          "12 PM - 2 PM",
                          presetFontSizes: [26,22,18,14],
                          
                        )
                      ),
                      SizedBox(height:screenheight*0.02),
                      Container(
                        height: screenheight*0.25,
                        width:screenwidth*0.8,
                        padding: EdgeInsets.symmetric(vertical:screenheight*0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color:Colors.green[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              )
                            ]
                          ),
                        child: Column(
                          children: lunch.map((item) {
                            return Container(
                              height: screenheight*0.04,
                              child: AutoSizeText(
                                "• $item",
                                presetFontSizes: [22,20,18,16,14],
                              ),
        
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height:screenheight*0.03),
                  Column(
                    children: [
                      Container(
                        height: screenheight*0.03,
                        child:AutoSizeText(
                          "Lunch",
                          presetFontSizes: [30,26,22,18,14],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          
                        )
                      ),
                      Container(
                        height: screenheight*0.02,
                        child:AutoSizeText(
                          "7 PM - 9:30 PM",
                          presetFontSizes: [26,22,18,14],
                          
                        )
                      ),
                      SizedBox(height:screenheight*0.02),
                      Container(
                        height: screenheight*0.25,
                        width:screenwidth*0.8,
                        padding: EdgeInsets.symmetric(vertical:screenheight*0.02),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                            color:Colors.green[50],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              )
                            ]
                          ),
                        child: Column(
                          children: dinner.map((item) {
                            return Container(
                              height: screenheight*0.04,
                              child: AutoSizeText(
                                "• $item",
                                presetFontSizes: [22,20,18,16,14],
                              ),
        
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenheight*0.1),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}