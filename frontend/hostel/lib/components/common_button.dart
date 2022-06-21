import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  double height;
  double width;
  Function onPress;
  String title;
  String? type;
  CommonButton(
      {required this.height,
      required this.width,
      required this.onPress,
      required this.title,
      this.type
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border:Border.all(color:type!='red'?Colors.blueGrey:Colors.red,width:1),
          color: type=='purple'?Colors.blueGrey[900]:Colors.transparent,
        ),
        child: Container(
          height: height * 0.8,
          width: width*0.6,
          padding: EdgeInsets.symmetric(
              horizontal: width*0.2, vertical: height * 0.1),
          child: Center(
            child: AutoSizeText(title,
                presetFontSizes: [18,16, 14,12,10,8,6],
                textAlign: TextAlign.center,
                maxLines: 1,
                style: TextStyle(
                  color: type=='purple'?Colors.white:type=='red'?Colors.red:Colors.blueGrey[900],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                )),
          ),
        ),
      ),
    );
  }
}