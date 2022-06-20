import 'package:flutter/material.dart';
import 'package:hostel/components/text_container.dart';

class AttendanceTile extends StatelessWidget {
  const AttendanceTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width:width*0.9,
      // height:height*0.1,
      padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical:height*0.01),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          )
        
        ]
        
      ),
      child:Row(
        children: [
          Column(
            children: [
              TextContainer(
                text: "AGILAN",
               presetFontSizes: [24,22,20,18,16],
               width:width*0.5,
              ),
              TextContainer(
                text: "B-522",
               presetFontSizes: [24,22,20,18,16],
               width:width*0.5,
              ),
            ],
          ),
          Container(
            width:width*0.3,
            height:height*0.04,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
            ),
            child:TextContainer(
                text: "Present",
               presetFontSizes: [24,22,20,18,16],
               width:width*0.2,
               textAlign: TextAlign.center,
              ),
          ),
        ],
      ),
    ); 
  }
}