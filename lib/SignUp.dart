import 'HomePage.dart';
import 'MainPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'User.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void _submitForm(){

    _formKey.currentState.save();
    _user.getData();

  }

  User _user = User();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('Assets/sidescreen.png'),
                  ),
                  Positioned(
                    top: 15,
                    left: 10,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                        size: 40,
                        color: Colors.black,
                      ),
                      onPressed: ()=> Navigator.push(context, MaterialPageRoute(
                          builder: (_)=>MainPage()),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 180,
                      left: 60,
                      child: Text('Create Account...',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily:'Lobster Two'
                        ),
                      )
                  ),
                  Positioned(
                    top: 250,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(6, 4.8),
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          onSaved: (String value){
                              _user.name = value;
                              print(_user.name);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person,
                              color: Colors.black,
                              size: 28,
                            ),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 310,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(6, 4.8),
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          onSaved: (String value){
                            _user.email = value;
                            print(_user.email);
                          }
                          ,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,
                              color: Colors.black,
                              size: 28,
                            ),
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 370,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(6, 4.8),
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          onSaved: (String value){
                            _user.mobileno = value;
                            print(_user.mobileno);
                          }
                          ,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone_in_talk,
                              color: Colors.black,
                              size: 28,
                            ),
                            labelText: 'Mobile Number',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 242,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(6, 4.8),
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          onSaved: (String value){
                            _user.adhaarid = value;
                            print(_user.adhaarid);
                          }
                          ,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.check_box_outline_blank,
                              color: Colors.black,
                              size: 28,
                            ),
                            labelText: 'Aadhar ID',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 180,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(6, 4.8),
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          obscureText: true,

                          onSaved: (String value){
                            _user.password = value;
                            print(_user.password);
                          }
                          ,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,
                              color: Colors.black,
                              size: 28,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 118,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/14,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 1,
                              offset: Offset(6, 4.8),
                            )
                          ]
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10),
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_open,
                              color: Colors.black,
                              size: 28,
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 48,
                    left: 110,
                    child: InkWell(
                      onTap: ()=> {
                        _submitForm(),
                        Navigator.push(context, MaterialPageRoute(
                        builder: (_)=> HomePage(),
                      ),
                      ),
                      },
                      child: Container(
                          height: MediaQuery.of(context).size.height/17,
                          width: MediaQuery.of(context).size.width/3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                              color: Colors.orange,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.orange.withOpacity(0.7),
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  offset: Offset(1, 1),
                                ),
                              ]
                          ),
                          child: Center(
                            child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lobster Two'
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}