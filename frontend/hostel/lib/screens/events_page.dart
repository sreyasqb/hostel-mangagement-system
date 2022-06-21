import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hostel/components/events_card.dart';
import 'package:provider/provider.dart';

import '../components/common_gradient.dart';
import '../components/text_container.dart';
import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../provider/user_provider.dart';

class EventsPage extends StatefulWidget {
  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  List events = [];
  bool loading = true;
  @override
  void initState() {
    getEvents();
    super.initState();
  }

  void getEvents() async {
    var user = Provider.of<UserData>(context, listen: false);
    
    if (user.uType != UserType.staff) {
      http.Response response = await http.get(
        Uri.parse("$baseurl/events/all"),
        headers: headers,
      );
      List eventsJson = jsonDecode(response.body);
      print(eventsJson);
      setState(() {
        events = eventsJson;
        loading = false;
      });
     
    }
    else{
      setState(() {
        events=user.myUser.events;
        print(events);
        loading=false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserData>(context, listen: false);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.05, vertical: height * 0.02),
      height: height,
      width: width,
      decoration: CommonGradient,
      child: !loading
          ? Column(
              children: [
                TextContainer(
                  text: user.uType != UserType.staff
                      ? 'EVENTS'
                      : "EVENTS INCHARGE",
                  presetFontSizes: [30, 28, 26, 24, 22, 20, 18, 16],
                  width: width * 0.9,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: height * 0.01),
                Expanded(
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: height * 0.01),
                          child: user.uType!=UserType.staff? EventsCard(
                              name: events[index]['name'],
                              date: DateTime.parse(events[index]['event_date']),
                              time: events[index]['event_time'],
                              location: events[index]['location']):
                              EventsCard(
                                  name: events[index]['name'],
                                  date: DateTime.now(),
                                  time: "",
                                  location: events[index]['event_id'],
                              
                              ));
                    },
                  ),
                ),
              ],
            )
          : SpinKitWave(
              size: height * 0.1,
              color: Colors.blueGrey[900],
            ),
    ));
  }
}
