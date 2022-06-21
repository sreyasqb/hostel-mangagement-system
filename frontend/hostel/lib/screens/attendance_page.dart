import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel/components/attendance_tile.dart';
import 'package:hostel/components/common_button.dart';
import 'package:hostel/components/common_gradient.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../components/text_container.dart';
import '../constants/constants.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List residents = [];
  List<String> absentees=[];
  @override
  void initState() {
    getResidents();
    super.initState();
  }

  void submitAttendance(List attendance) async {
    for (var a in attendance){
      http.Response response = await http.post(
        Uri.parse("$baseurl/new/absentee"),
        headers: headers,
        body: jsonEncode({
          "id": a,
          "date": DateTime.now().toString(),
        }),
      );
      print(response.body);
    }
  }

  void getResidents() async {
    http.Response response = await http.get(
      Uri.parse("$baseurl/block/residents/S101"),
    );
    List residentsJson = jsonDecode(response.body);
    print(residentsJson);
    setState(() {
      residents = residentsJson;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.02),
          height: height,
          decoration: CommonGradient,
          width: width,
          child: Column(
            children: [
              TextContainer(
                text: 'B-Block',
                presetFontSizes: [30, 28, 26, 24, 22, 20, 18, 16],
                width: width * 0.9,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.01),
              TextContainer(
                text: '${DateFormat('MMMMEEEEd').format(DateTime.now())}',
                presetFontSizes: [22, 20, 18, 16],
                width: width * 0.9,
                textAlign: TextAlign.center,
                style: TextStyle(
                    // fontWeight: FontWeight.w500,
                    ),
              ),
              SizedBox(height: height * 0.01),
              Expanded(
                child: ListView.builder(
                  itemCount: residents.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: height*0.01),
                      child: AttendanceTile(
                        name: residents[index]['name'],
                        id: residents[index]['id'],
                        roomNo: residents[index]['room_no'],
                        onTap: (int value,String id){
                          if (value==2){
                            setState(() {
                              absentees.add(id);
                            });
                          }
                          else if(value!=2 && absentees.contains(id)){
                            setState(() {
                              absentees.remove(id);
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              CommonButton(height: height*0.06, width: width*0.7, onPress: (){
                print(absentees);
                submitAttendance(absentees);
              }, title: 'SUBMIT',type:"purple"),
            ],
          )),
    );
  }
}
