import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  

  @override
  _HomePageState createState() => _HomePageState();
}
double screenheight=0,screenwidth=0;
class _HomePageState extends State<HomePage> {
  String name="Sreyas";
  double balance=7640;
  DateTime date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      
      // backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenwidth*0.05),
        decoration: CommonGradient,
        child:Column(
          children: [
            SizedBox(height:screenheight*0.07),
            Container(
              height: screenheight*0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: screenheight*0.07,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:screenheight*0.05,
                          child:AutoSizeText(
                            "Hi $name",
                            presetFontSizes: [30,28,26,24,22,20],
                            style:TextStyle(
                              fontWeight: FontWeight.bold,
                              
                            )
                          )
                        ),
                        Container(
                          height:screenheight*0.02,
                          child:AutoSizeText(
                            "Welcome back",
                            presetFontSizes: [26,24,22,20,18,16],
                            style:TextStyle(
                              fontWeight: FontWeight.w400,
                              color:Colors.blueGrey[600],
                            )
                          )
                          
                        )
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: screenheight*0.03,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  )
                ],
              ),
            ),
            SizedBox(height:screenheight*0.05),
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: screenwidth*0.05,vertical: screenheight*0.01),
            //   height: screenheight*0.1,
            //   decoration:BoxDecoration(
            //     color:Colors.green[100],
            //     borderRadius: BorderRadius.circular(20),
            //     // border:Border.all(
            //     //   color:Colors.green,
            //     // )
            //     boxShadow: [
            //     BoxShadow(
            //       color: Colors.grey.withOpacity(0.5),
            //       spreadRadius: 5,
            //       blurRadius: 7,
            //       offset: Offset(0, 3), // changes position of shadow
            //     ),
            //   ],
            //   ),
              
            //   child:Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Container(
            //         height:screenheight*0.02,
            //         child:AutoSizeText(
            //           "Balance",
            //           presetFontSizes: [26,24,22,20,18,16],
            //           style:TextStyle(
            //             fontWeight: FontWeight.w400,
            //             color:Colors.blueGrey[600],
            //           )
            //         )
                    
            //       ),
            //       Container(
            //         height:screenheight*0.05,
            //         width:screenwidth*0.9,
            //         child:AutoSizeText(
            //           "\u{20B9} ${balance.toString()}",
            //           presetFontSizes: [30,28,26,24,22,20],
            //           style:TextStyle(
            //             fontWeight: FontWeight.bold,
            //           )
            //         )
            //       ),
                        
            //     ],
            //   )
            // )
            Row(
              children: [
                Container(
                padding: EdgeInsets.symmetric(horizontal: screenwidth*0.05,vertical: screenheight*0.01),
                height: screenheight*0.3,
                width: screenwidth*0.45,
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
                    children: [
                      Container(
                        height: screenheight*0.03,
                        child: AutoSizeText(
                          "MESS TOKENS",
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
                      Image.asset('assets/hot-pot.png'),
                    ],
                  )
                  
                  
                  
                )
              ],
            )

          ],
        )
      ),
    );
  }
}