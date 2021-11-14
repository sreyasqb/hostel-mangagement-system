import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CreatePostButton extends StatelessWidget {
  final Icon icon;
  final String title;
  final Color color;
  final Function onPressed;
  CreatePostButton({required this.icon, required this.title, required this.color,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () =>onPressed(), 
      child: Container(
        width:screenwidth * 0.3,
        height: screenheight*0.06,
        decoration: BoxDecoration(
          color:color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border:Border.all(color: Colors.black,width:0.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(width:screenwidth*0.01),
            Container(
              width:screenwidth * 0.21,
              child: AutoSizeText(
                title,
                // minFontSize: 6,
                // stepGranularity: 1,
                presetFontSizes: [16,12,8,6],
                maxLines:2,
                style:TextStyle(
                  // fontSize: 18,
                  color:Colors.black,
                  fontWeight: FontWeight.w400,
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}