import 'GiveParking.dart';
import 'package:flutter/material.dart';

class ParkingPics extends StatefulWidget {
  @override
  _ParkingPicsState createState() => _ParkingPicsState();
}

class _ParkingPicsState extends State<ParkingPics> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: PageView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Image(image: AssetImage('Assets/second.png'),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Image(image: AssetImage('Assets/getpark.jpg'),
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Image(image: AssetImage('Assets/first.png'),
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(23.0),topRight: Radius.circular(23)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26.withOpacity(0.2),
                              blurRadius: 20,
                              offset: Offset(8, 10),
                              spreadRadius: 20,
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top:80.0),
          child: FloatingActionButton(
            onPressed: ()=> GiveParking(),
            child: Icon(Icons.arrow_back,
              size: 18,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            elevation: 20.0,

          ),
        ),
      ),
    );
  }
}