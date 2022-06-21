import 'package:flutter/material.dart';
import 'package:hostel/components/text_container.dart';

class AttendanceTile extends StatefulWidget {
  const AttendanceTile({Key? key}) : super(key: key);

  @override
  State<AttendanceTile> createState() => _AttendanceTileState();
}

class _AttendanceTileState extends State<AttendanceTile> {
  int loop=0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: (){
        setState(() {
          loop+=1;
        });
      },
      child: Container(
        width:width*0.9,
        // height:height*0.1,
        padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical:height*0.01),
        decoration: BoxDecoration(
          color: loop%3==0?Colors.green[50]:loop%3==1?Colors.greenAccent:Colors.redAccent,
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
                color: loop%3==0?Colors.green[200]:loop%3==1?Colors.green[300]:Colors.red[700],
                borderRadius: BorderRadius.circular(10),
              ),
              child:TextContainer(
                  text: loop%3==0?"MARK":loop%3==1?"PRESENT":"ABSENT",
                 presetFontSizes: [24,22,20,18,16],
                 width:width*0.2,
                 textAlign: TextAlign.center,
                ),
            ),
          ],
        ),
      ),
    ); 
  }
}