import 'package:flutter/material.dart';
import 'package:hostel/components/attendance_tile.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:intl/intl.dart';

import '../components/text_container.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  
  void getResidents() async {

  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.02),
        height:height,
        decoration: CommonGradient,
        width:width,
        child:Column(
          children: [
            TextContainer(
              text:'B-Block',
              presetFontSizes:[30,28,26,24,22,20,18,16],
              width:width*0.9,
              textAlign: TextAlign.center,
              style:TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height:height*0.01),
            TextContainer(
              text:'${DateFormat('MMMMEEEEd').format(DateTime.now())}',
              presetFontSizes:[22,20,18,16],
              width:width*0.9,
              textAlign: TextAlign.center,
              style:TextStyle(
                // fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height:height*0.01),
            AttendanceTile()
          ],
        )
      ),
    );
  }
}