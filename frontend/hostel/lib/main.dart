// import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hostel/provider/user_provider.dart';
import 'package:hostel/screens/home_page.dart';
import 'package:hostel/screens/login_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(/*DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  )*/MyApp());
}


class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
