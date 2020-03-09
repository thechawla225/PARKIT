import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'SignUp.dart';

class User {

  String name;
  String email;
  String adhaarid;
  String mobileno;
  String password;
  String lat;
  String long;
  String distance;

  User();

  Map data;
  List userData;


  Future getData() async {
    print("request");
    http.Response response = await http.get("http://parkaway.herokuapp.com/register/?name=$name&email=$email&mobile=$mobileno&aadhar=$adhaarid&passwd=$password");
    print("Starting");
    data = json.decode(response.body);
    print(data);
    print("http://parkaway.herokuapp.com/register/?name=$name&email=$email&mobile=$mobileno&aadhar=$adhaarid&passwd=$password");
  }
  Future getDataa() async {
    print("request");
    http.Response response = await http.get("http://parkaway.herokuapp.com/login/?email=$email&passwd=$password");
    print("Starting");
    data = json.decode(response.body);
    print(data);
    print("http://parkaway.herokuapp.com/login/?email=$email&passwd=$password");
  }

}