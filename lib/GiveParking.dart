import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'ParkingPics.dart';

class GiveParking extends StatefulWidget {
  @override
  _GiveParkingState createState() => _GiveParkingState();
}

class _GiveParkingState extends State<GiveParking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    onPressed: ()=> HomePage(),
                  ),
                ),
                Positioned(
                    top: 170,
                    left: 140,
                    child: Text('Policy',
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lobster Two'
                      ),
                    )
                ),
                Positioned(
                    bottom: 110,
                    left: 20,
                    child: Container(
                      padding: EdgeInsets.only(right: 5,left: 5),
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width/1.1,
                      child: Text('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'
                          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.visible,
                      ),
                    )
                ),
                Positioned(
                  bottom: 48,
                  right: 120,
                  child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(
                      builder: (_)=> HomePage(),
                    ),
                    ),
                    child: Container(
                        height: MediaQuery.of(context).size.height/26,
                        width: MediaQuery.of(context).size.width/4.5,
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
                          child: Text('Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Lobster Two'
                            ),
                          ),
                        )
                    ),
                  ),
                ),
                Positioned(
                  bottom: 48,
                  right: 20,
                  child: InkWell(
                    onTap: ()=> Navigator.push(context, MaterialPageRoute(
                      builder: (_)=> ParkingPics(),
                    ),
                    ),
                    child: Container(
                        height: MediaQuery.of(context).size.height/26,
                        width: MediaQuery.of(context).size.width/4.5,
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
                          child: Text('Agree',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
    );
  }
}