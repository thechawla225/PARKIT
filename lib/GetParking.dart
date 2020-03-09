import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'User.dart';
class Mapit extends StatefulWidget {
  @override
  _MapitState createState() => _MapitState();
}

class _MapitState extends State<Mapit> {
  User _user = User();
  Map data;
  List userData;

  Completer<GoogleMapController> controller1;
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  static  LatLng _lastMapPosition = _initialPosition;

  @override
  void initState() {
    super.initState();
    _getUserLocation();
  }

  Future getData(var lat , var long) async {
    print(lat);
    print(long);
    print("request");
    print("http://parkaway.herokuapp.com/getparking/?lat=12.9699155&lon=79.1556612");

    Future getData() async {
      http.Response response = await http.get("http://parkaway.herokuapp.com/getparking/?lat=12.9699155&lon=79.1556612");
      data = json.decode(response.body);
      print(data);

        _user.email = data["email"];
        _user.lat = data["lat1"];
        _user.long = data["long1"];
        _user.distance = data["distance"];

        print(_user.email);
        print(_user.lat);
        print(_user.long);
        print(_user.distance);


    }

  }


  void _getUserLocation() async {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    getData(position.latitude , position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
      _markers.add(
          Marker(
            markerId: MarkerId(_initialPosition.toString()),
            position: _initialPosition,
            infoWindow: InfoWindow(
                title: "Your Location",
                onTap: (){
                }
            ),
            onTap: (){
            },

            icon: BitmapDescriptor.defaultMarker,
          ));
      _markers.add(
          Marker(
            markerId: MarkerId(_lastMapPosition.toString()),
            position: LatLng(12.9717, 79.1594),
            infoWindow: InfoWindow(
                title: "Parking Location",
                snippet: "Park Here !",
                onTap: (){
                }
            ),
            onTap: (){
            },

            icon: BitmapDescriptor.defaultMarkerWithHue(30),
          ));
    });
  }


  _onMapCreated(GoogleMapController controller) {
    setState(() {
      controller1.complete(controller);
    });
  }

  MapType _currentMapType = MapType.normal;


  _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(
          Marker(
              markerId: MarkerId(_lastMapPosition.toString()),
              position: _lastMapPosition,
              infoWindow: InfoWindow(
                  title: "Pizza Parlour",
                  snippet: "This is a snippet",
                  onTap: (){
                  }
              ),
              onTap: (){
              },

              icon: BitmapDescriptor.defaultMarker));
    });
  }
  Widget mapButton(Function function, Icon icon, Color color) {
    return RawMaterialButton(
      onPressed: function,
      child: icon,
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: color,
      padding: const EdgeInsets.all(7.0),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          elevation: 0,
        ),
        floatingActionButton: SpeedDial(
          marginRight: 18,
          marginBottom: 20,
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          // this is ignored if animatedIcon is non null
          // child: Icon(Icons.add),
          // If true user is forced to close dial manually
          // by tapping main button and overlay is not rendered.
          closeManually: false,
          curve: Curves.bounceIn,
          overlayColor: Colors.black,
          overlayOpacity: 0.5,
          onOpen: () => print('OPENING DIAL'),
          onClose: () => print('DIAL CLOSED'),
          tooltip: 'Speed Dial',
          heroTag: 'speed-dial-hero-tag',
          backgroundColor: Colors.orangeAccent,
          foregroundColor: Colors.black,
          elevation: 8.0,
          shape: CircleBorder(),
          children: [
            SpeedDialChild(
                child: Icon(MdiIcons.clockFast),
                backgroundColor: Colors.red,
                label: 'Instant',
                labelStyle: TextStyle(fontSize: 18.0),
                onTap: () => print('FIRST CHILD')
            ),
            SpeedDialChild(
              child: Icon(MdiIcons.circleSlice5),
              backgroundColor: Colors.blue,
              label: 'Select Time Slot',
              labelStyle: TextStyle(fontSize: 18.0),
              onTap: () => print('SECOND CHILD'),
            ),
          ],
        ) ,
        body: _initialPosition == null ? Container(child: Center(child:Text('Hold Tight ! We will find you Some Parking', style: TextStyle(fontFamily: 'Avenir-Medium', color: Colors.orange, fontSize: 15),),),) :
        Container(
          child:
          GoogleMap(
            markers: _markers,

            mapType: _currentMapType,
            initialCameraPosition: CameraPosition(
              target: _initialPosition,
              zoom: 20,
            ),
            onMapCreated: _onMapCreated,
            zoomGesturesEnabled: true,
            onCameraMove: _onCameraMove,
            myLocationEnabled: true,
            compassEnabled: true,
            myLocationButtonEnabled: false,

          ),


        )

    );

  }
}