import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';



import 'package:flutter/material.dart';
import 'package:hostel/components/create_post_button.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:http/http.dart' as http;





class CreatePost extends StatefulWidget {
  String name;
  
  CreatePost({required this.name});

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {

  TextEditingController textEditingController=TextEditingController();

  @override
  

  List<Color> vals = [
    Color(0xFFD6E1E3),
    Color(0xFFD6E1E3),
    Color(0xFFD6E1E3),
    Color(0xFFD6E1E3)
  ];

  void changeColor(int value) {
    for (int i = 0; i < 4; i++) {
      setState(() {
        if (i == value)
          vals[i] = Colors.white;
        else
          vals[i] = Color(0xFFD6E1E3);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return AlertDialog(

        // title:Text("login"),
        insetPadding:
            EdgeInsets.symmetric(horizontal: 0, vertical: screenheight * 0.00),
        backgroundColor: Colors.transparent,
        content: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: screenheight * 0.87,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 9,
                        child: Container(
                          width: screenwidth * 0.6,
                          height: screenheight * 0.04,
                          child: AutoSizeText(
                            "Create Post",
                            minFontSize: 12,
                            textAlign: TextAlign.center,
                            stepGranularity: 1,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close,
                                color: Colors.white, size: screenwidth * 0.06),
                          )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 15,
                    child: Container(
                      width: screenheight * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: AssetImage("assets/profile.jpg"),
                                radius:screenheight*0.02,
                                
                              ),
                              title: Text(widget.name),
                              subtitle: Text("Share with all"),
                              trailing: InkWell(
                                child: Icon(Icons.notification_important),
                                onTap: () {
                                  // print(screenheight);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenwidth * 0.04,
                                  vertical: screenheight * 0.04),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: TextField(
                                  controller: textEditingController,
                                  cursorColor: Colors.black,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: screenwidth * 0.05,
                                        vertical: screenwidth * 0.02),
                                    border: InputBorder.none,
                                    hintText: "Write something here...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenwidth * 0.05),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CreatePostButton(
                                            icon: Icon(Icons.photo),
                                            color: vals[0],
                                            onPressed: () {
                                              changeColor(0);
                                            },
                                            title: "Add photos",
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth * 0.02,
                                        ),
                                        Expanded(
                                          child: CreatePostButton(
                                            icon:
                                                Icon(Icons.camera_alt_outlined),
                                            color: vals[1],
                                            onPressed: () {
                                              changeColor(1);
                                            },
                                            title: "Click",
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(height: screenheight * 0.005),
                                Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenwidth * 0.05),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CreatePostButton(
                                            icon: Icon(Icons.file_copy),
                                            color: vals[2],
                                            onPressed: () {
                                              changeColor(2);
                                            },
                                            title: "Add Files",
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenwidth * 0.02,
                                        ),
                                        Expanded(
                                          child: CreatePostButton(
                                            icon: Icon(Icons.poll_outlined),
                                            color: vals[3],
                                            onPressed: () {
                                              changeColor(3);
                                            },
                                            title: "Poll",
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                    flex: 1,
                                    child:
                                        SizedBox(height: screenheight * 0.01)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: screenheight * 0.01),
                Expanded(
                  flex: 2,
                  child: SlideAction(
                    sliderRotate: false,
                    text: "SWIPE TO POST",
                    sliderButtonIconPadding: 12,
                    sliderButtonIcon: Icon(Icons.double_arrow_rounded),
                    borderRadius: 30,
                    onSubmit: () async {
                      
                      // http.Response response=await http.post(Uri.parse("$baseurl/posts/${widget.id}"),
                      // headers: <String, String>{
                      // 'Content-Type': 'application/json; charset=UTF-8',
                      // 'Authorization' : token,
                      // },
                      // body: jsonEncode(<String,String>{
                      //   'text':textEditingController.text,
                      // }));
                      // print(response.body);
                    },
                    // sliderButtonIconSize: 40,
                    // alignment: Alignment.centerRight,

                    textStyle: TextStyle(
                      color: Colors.black54,
                      fontSize: 20,
                    ),
                    innerColor: Colors.white,
                    outerColor: Color(0xFFD6E1E3),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}