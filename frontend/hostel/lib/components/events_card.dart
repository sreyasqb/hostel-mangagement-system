import 'package:flutter/material.dart';
import 'package:hostel/components/text_container.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../constants/constants.dart';
import '../provider/user_provider.dart';

class EventsCard extends StatelessWidget {
  String name;
  DateTime date;
  String time;
  String location;
  EventsCard(
      {required this.name,
      required this.date,
      required this.time,
      required this.location});
  @override
  Widget build(BuildContext context) {
    // print(DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time)));
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      width: width * 0.4,
      // height:height*0.,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green[100],
      ),
      child: Column(
        children: [
          TextContainer(
            text: name,
            presetFontSizes: [22, 20, 18, 16],
            width: width * 0.6,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w600,

            ),
          ),
          if (Provider.of<UserData>(context, listen: false).uType != UserType.staff)
          TextContainer(
            // text:"",
                text: "${DateFormat('MMMMEEEEd').format(date)}   ${DateFormat.jm().format(DateFormat("hh:mm:ss").parse(time))}",
                presetFontSizes: [16,14,12,10],
                width: width * 0.6,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
          TextContainer(
            text: location,
            presetFontSizes: [18, 16,14,12],
            width: width * 0.6,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
