class UserModel{
  String name;
  String id;
  String email;
  String phoneNo;
  UserModel({required this.name,required this.id,required this.email,required this.phoneNo});

}

class Resident extends UserModel {
  String roomNo;
  String course;
  String department;
  Resident({required this.roomNo,required this.course,required this.department,name,email,id,phoneNo}) : super(name:name,email:email,phoneNo:phoneNo,id:id);
}

class Supervisor extends UserModel {
  String block;
  Supervisor({required this.block,department,name,email,id,phoneNo}) : super(name:name,email:email,phoneNo:phoneNo,id:id);
}

class ResidentTutor extends UserModel {
  String roomNo;
  ResidentTutor({required this.roomNo,name,email,id,phoneNo}) : super(name:name,email:email,phoneNo:phoneNo,id:id);
}
