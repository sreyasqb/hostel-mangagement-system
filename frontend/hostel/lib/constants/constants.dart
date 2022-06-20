
String baseurl="https://hostel-dbms.herokuapp.com/";
enum UserType {
  none,
  resident,
  supervisor,
  residentTutor 
}
Map <String,String> headers= <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };