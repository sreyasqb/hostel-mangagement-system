import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/screens/home_page.dart' show screenheight,screenwidth;
import 'package:intl/intl.dart';

class FoodCard extends StatelessWidget {
  
  String title;
  final DateTime date;
  final String image;
  final Function onPress;
  FoodCard({required this.date,required this.image,required this.onPress,required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>onPress(),
      child: Container(
      padding: EdgeInsets.symmetric(horizontal: screenwidth*0.05,vertical: screenheight*0.03),
      height: screenheight*0.3,
      width: screenwidth*0.43,
      decoration:BoxDecoration(
        color:Colors.green[100],
        borderRadius: BorderRadius.circular(20),
        
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: screenheight*0.03,
                  child: AutoSizeText(
                    title,
                    presetFontSizes: [30,26,20,16,12],
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                ),
                Container(
                  height: screenheight*0.03,
                  child:AutoSizeText(
                    DateFormat('MMMMEEEEd').format(date),
                  )
                ),
              ],
            ),
            
            Image.asset(image,width:screenwidth*0.3,height: screenheight*0.15,),
          ],
        ),
        
        
        
        
      ),
    );
  }
}