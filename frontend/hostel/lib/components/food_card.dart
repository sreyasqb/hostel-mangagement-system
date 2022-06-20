import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/screens/home_page.dart' show height, width;
import 'package:intl/intl.dart';

class FoodCard extends StatelessWidget {
  String title;
  final DateTime date;
  final String image;
  final Function onPress;
  bool? tokenBought;
  FoodCard(
      {required this.date,
      required this.image,
      required this.onPress,
      required this.title, this.tokenBought});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.05, vertical: height * 0.03),
        height: height * 0.3,
        width: width * 0.43,
        decoration: BoxDecoration(

            color: tokenBought!=null && tokenBought!?Colors.red:Colors.green[100],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: height * 0.03,
                  child: AutoSizeText(title,
                      presetFontSizes: [30, 26, 20, 16, 12],
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                    height: height * 0.03,
                    child: AutoSizeText(
                      DateFormat('MMMMEEEEd').format(date),
                    )),
              ],
            ),
            Image.asset(
              image,
              width: width * 0.3,
              height: height * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
