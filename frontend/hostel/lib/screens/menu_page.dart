import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/screens/home_page.dart' show screenheight,screenwidth;

List <String> breakfast=['omlette,pongal,sambar,maggi',"coffee"];
List <String> lunch=['rasam,rice,sambar,curd,chicken'];
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

        child:Column(
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
                    Container(
                      height: screenheight*0.25,
                      child: Column(
                        children: breakfast.map((item) {
                          return Container(

                          );
                        }).toList(),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )
      ),
    );
  }
}