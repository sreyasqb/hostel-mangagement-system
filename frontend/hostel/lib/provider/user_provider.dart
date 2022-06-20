
import 'package:flutter/material.dart';
import 'package:hostel/models/user_model.dart';

import '../constants/constants.dart';

class UserData extends ChangeNotifier {

  UserType uType=UserType.none;
  var myUser;
  // Resident? resident;
  // Supervisor? supervisor;
  // ResidentTutor? residentTutor;

  void setUserType(UserType u,var uData){
    uType=u;
    if (u==UserType.resident){
      myUser=uData as Resident;
    }
    else if (u==UserType.supervisor){
      myUser=uData as Supervisor;
    }
    else if (u==UserType.residentTutor){
      myUser=uData as ResidentTutor;
    }
    
  }

}