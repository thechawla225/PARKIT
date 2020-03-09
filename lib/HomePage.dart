import 'MainPage.dart';
import 'package:flutter/material.dart';

import 'GetParking.dart';
import 'GiveParking.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  top: 15,
                  left: 10,
                  child: IconButton(
                    onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                        builder: (_)=> MainPage()
                    ),
                    ),
                    icon: Icon(Icons.arrow_back,
                      size: 33,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 85,
                  child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>Mapit(),
                    ),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.9,
                      height: MediaQuery.of(context).size.height/3.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              offset: Offset(5, 5),
                              blurRadius: 25,
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('Assets/getpark.jpg'),
                            height: 140,
                            width: 180,
                          ),
                          SizedBox(height: 10),
                          Text('Get a Parking',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lobster Two',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 85,
                  child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>Mapit(),
                    ),
                    ),
                    child:Container(
                      width: MediaQuery.of(context).size.width/1.9,
                      height: MediaQuery.of(context).size.height/3.7,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              offset: Offset(5, 5),
                              blurRadius: 25,
                            )
                          ]
                      ),
                      child: Column(
                        children: <Widget>[
                          Image(image: AssetImage('Assets/second.png'),
                            height: 140,
                            width: 180,
                          ),
                          SizedBox(height: 10),
                          Text('Give a Parking',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lobster Two'
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}