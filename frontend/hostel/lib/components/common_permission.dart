import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/screens/home_page.dart' show height, width;

class CommonPermission extends StatelessWidget {
  String title;
  Function onPress;
  CommonPermission({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.02, vertical: height * 0.02),
          width: width * 0.9,
          height: height * 0.07,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green[50],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.8,
                height: height * 0.05,
                child: AutoSizeText(
                  title,
                  presetFontSizes: [30, 26, 22, 18, 14],
                  maxLines: 1,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: height * 0.02,
              )
            ],
          )),
    );
  }
}
