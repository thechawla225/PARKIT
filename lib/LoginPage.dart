import 'MainPage.dart';
import 'SignUp.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'User.dart';
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  User _user = User();
  _submitForm(){
    _formKey.currentState.save();
    _user.getDataa();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Form(key: _formKey,
          autovalidate: true,
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Image(
                    image: AssetImage('Assets/sidescreen.png'),
                  ),
                  Positioned(
                    left: 10.0,
                    top: 15.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                        size: 33,
                        color: Colors.black,
                      ),
                      onPressed: ()=> Navigator.push(context, MaterialPageRoute(
                        builder: (_)=>MainPage(),
                      ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    left: 70,
                    child: Column(
                      children: <Widget>[
                        Text('Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster Two',
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Please sign in to continue',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 33,
                    left: 58,
                    child: Row(
                      children: <Widget>[
                        Text('Dont have an account ? ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18.0,
                          ),
                        ),
                        InkWell(
                          onTap: ()=> Navigator.push(context, MaterialPageRoute(
                            builder: (_) => SignUp(),
                          ),
                          ),
                          child: Text('Sign Up',
                            style: TextStyle(
                              color: Colors.orange,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 350,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            offset: Offset(7, 0),
                            spreadRadius: 0.5,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                        width: MediaQuery.of(context).size.width/2,
                        child: TextFormField(
                          onSaved: (String value){
                            _user.email = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email,
                              color: Colors.black,
                              size: 27,
                            ),
                            labelText: 'Email ID',
                            labelStyle: TextStyle(
                                fontSize: 20.5
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 200,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: MediaQuery.of(context).size.height/10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            offset: Offset(7, 0),
                            spreadRadius: 0.5,
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                        width: MediaQuery.of(context).size.width/2,
                        child: TextFormField(
                          onSaved: (String value){
                            _user.password = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock,
                              size: 27,
                              color: Colors.black,
                            ),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontSize: 20.5
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 85,
                    left: 110,
                    child: Container(
                      height: MediaQuery.of(context).size.height/17,
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        color: Colors.orange,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.orange.withOpacity(0.7),
                            offset: Offset(1, 1),
                            spreadRadius: 2,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {
                          _submitForm();
                          Navigator.push(context, MaterialPageRoute(
                          builder: (_) => HomePage(),
                        ),
                        );
  },
                        child: Center(
                          child: Text('Login',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lobster Two',
                            ),
                          ),
                        ),
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