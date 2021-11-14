import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:hostel/screens/home_page.dart' show screenheight,screenwidth;

class MessTokenPage extends StatelessWidget {
  double balance=7640;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenwidth*0.02),
        height:screenheight,
        width:screenwidth,
        decoration: CommonGradient,
        child:Column(
          children: [
            SizedBox(height: screenheight*0.07,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: screenwidth*0.02,vertical: screenheight*0.01),

              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:Colors.green[100],
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
                children: [
                  
                  Container(
                    height:screenheight*0.05,
                    child:AutoSizeText(
                      "Your Remaining Balance",
                      presetFontSizes: [30,26,22,18],
                      
                    )
                  ),
                  Container(
                    height:screenheight*0.05,
                    child:AutoSizeText(
                      "\u{20B9} $balance",
                      presetFontSizes: [30,26,22,18],
                      
                    )
                  ),

                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: [],
                )
              ],
            )
          ],
        )
        
      ),
    );
  }
}