import 'LoginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(

                child: Image(
                  image: AssetImage('Assets/sidescreen.png'),
                ),
              ),
              Positioned(
                top: 200,
                left: 94,
                child: Image(
                  height: 180,
                  width: 180,
                  image: AssetImage('Assets/logo.png'),
                ),
              ),
              Positioned(
                bottom: 190,
                left: 60,
                child: InkWell(
                  onTap: ()=> Navigator.push(context, MaterialPageRoute(
                    builder: (_)=>LoginPage(),
                  )
                  ),
                  child:Container(
                    height: MediaQuery.of(context).size.height/12,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: Offset(0.0, 0.0),
                          spreadRadius: 4,
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child:Center(
                      child: Text('Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster Two'
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                left: 60,
                child: InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(
                    builder: (_)=> SignUp(),
                  ),
                  ),
                  child:Container(
                    height: MediaQuery.of(context).size.height/12,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: Offset(0.0, 0.0),
                          spreadRadius: 4,
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child:Center(
                      child: Text('Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lobster Two'
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
    );
  }
}