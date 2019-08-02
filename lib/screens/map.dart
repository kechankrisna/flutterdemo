import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'drawer.dart';

Completer<GoogleMapController> _controller = Completer();

double current_latitude = 13.3825006;
double current_longitude = 103.8543488;
double current_zooom = 17.0;

CameraPosition _initialPosition = CameraPosition(
    target: LatLng(current_latitude, current_longitude), zoom: current_zooom);

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 3.0,
        title: Container(
            
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3.5)), color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  
                  onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  icon: Icon(
                    Icons.menu,
                    color: Colors.grey,
                  ),
                ),
                
                Container(
                  child: Text(
                    "Google map",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => print("object"),
                  icon: Icon(
                    Icons.keyboard_voice,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
        ),
      ),
      
      drawer: StyleDrawer(),
      body: Stack(
        children: <Widget>[
          MapContainer(),
          ZoomContainer(),
          PlacesContainer(),
        ],
      ),
    );
  }
}

//placebox widget
class PlaceBoxWidget extends StatelessWidget {
  final String title, short_description;
  final double latitude, longitude;
  final int star;

  const PlaceBoxWidget(
      {Key key,
      this.title,
      this.short_description,
      this.star,
      this.latitude,
      this.longitude})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        width: 300,
        margin: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.network(
                "https://theculturetrip.com/wp-content/uploads/2017/07/shutterstock_357075494.jpg"),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 12,
                          color: star >= 1 ? Colors.orange : Colors.grey,
                        ),
                        Icon(
                          Icons.star,
                          size: 12,
                          color: star >= 2 ? Colors.orange : Colors.grey,
                        ),
                        Icon(
                          Icons.star,
                          size: 12,
                          color: star >= 3 ? Colors.orange : Colors.grey,
                        ),
                        Icon(
                          Icons.star,
                          size: 12,
                          color: star >= 4 ? Colors.orange : Colors.grey,
                        ),
                        Icon(
                          Icons.star,
                          size: 12,
                          color: star >= 5 ? Colors.orange : Colors.grey,
                        )
                      ],
                    ),
                    Text(
                      short_description,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        current_latitude = latitude;
        current_longitude = longitude;
        
        _movetoPlace(latitude, longitude);
      },
    );
  }
}

//placescontainer
class PlacesContainer extends StatefulWidget {
  @override
  _PlacesContainerState createState() => _PlacesContainerState();
}

class _PlacesContainerState extends State<PlacesContainer> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 120.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            PlaceBoxWidget(
              title: "Sed ut perspiciatis undeffffff",
              short_description:
                  "Sed ut perspiciatis unde omnis iste natus ...",
              star: 5,
              latitude: 13.3825006,
              longitude: 103.8543488,
            ),
            PlaceBoxWidget(
              title: "Sed ut perspiciatis unde",
              short_description:
                  "Sed ut perspiciatis unde omnis iste natus ...",
              star: 4,
              latitude: 13.3814673,
              longitude: 103.8550569,
            ),
            PlaceBoxWidget(
              title: "Sed ut perspiciatis unde",
              short_description:
                  "Sed ut perspiciatis unde omnis iste natus ...",
              star: 3,
              latitude: 13.3813061,
              longitude: 103.8552984,
            ),
            PlaceBoxWidget(
              title: "Sed ut perspiciatis unde",
              short_description:
                  "Sed ut perspiciatis unde omnis iste natus ...",
              star: 2,
              latitude: 13.3811496,
              longitude: 103.8555559,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _movetoPlace(double lat, double lng) async {
  final GoogleMapController newcontroller = await _controller.future;
  CameraPosition _newPosition = CameraPosition(
      target: LatLng(lat, lng), zoom: 22, bearing: 45.0, tilt: 45.0);
  newcontroller.animateCamera(CameraUpdate.newCameraPosition(_newPosition));
}

//mapcontainer
class MapContainer extends StatefulWidget {
  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  List<Marker> _markers = <Marker>[
    Marker(
        markerId: MarkerId("LDP Siem reap"),
        position: LatLng(13.3825006, 103.8543488),
        infoWindow:
            InfoWindow(title: "LDP Siem reap", snippet: "Siemreap Province"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        onTap: () => print("LDP Siem reap")),
    Marker(
      markerId: MarkerId("Sampov Meas Siemreap"),
      position: LatLng(13.3814673, 103.8550569),
      infoWindow:
          InfoWindow(title: "Sampov Meas", snippet: "Sampov Meas snippet"),
      onTap: () => print("Sampov Meas"),
    ),
    Marker(
      markerId: MarkerId("Cheangen Siemreap"),
      position: LatLng(13.3813061, 103.8552984),
      infoWindow: InfoWindow(
          title: "Cheangen Siemreap", snippet: "Cheangen Siemreap snippet"),
      onTap: () => print("Cheangen Siemreap"),
    ),
    Marker(
      markerId: MarkerId("Gameshop Siemreap"),
      position: LatLng(13.3811496, 103.8555559),
      infoWindow: InfoWindow(
          title: "Gameshop Siemreap", snippet: "Gameshop Siemreap snippet"),
      onTap: () => print("Gameshop Siemreap"),
    )
  ];

  void _onMapCreated(GoogleMapController controller) {
    _controller.isCompleted ?? _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      onMapCreated: _onMapCreated,
      initialCameraPosition: _initialPosition,
      markers: Set.from(_markers),
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      // markers: {_ldpsiemreap, _sampovmeas, _changeen, _gameshop},
    );
  }

  // Marker _ldpsiemreap = Marker(
  //     markerId: MarkerId("LDP Siem reap"),
  //     position: LatLng(13.3825006, 103.8543488),
  //     infoWindow:
  //         InfoWindow(title: "LDP Siem reap", snippet: "Siemreap Province"),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
  //     onTap: () => print("LDP Siem reap"));

  // Marker _sampovmeas = Marker(
  //   markerId: MarkerId("Sampov Meas Siemreap"),
  //   position: LatLng(13.3814673, 103.8550569),
  //   infoWindow:
  //       InfoWindow(title: "Sampov Meas", snippet: "Sampov Meas snippet"),
  //   onTap: () => print("Sampov Meas"),
  // );

  // //13.3813061,103.8552984
  // Marker _changeen = Marker(
  //   markerId: MarkerId("Cheangen Siemreap"),
  //   position: LatLng(13.3813061, 103.8552984),
  //   infoWindow: InfoWindow(
  //       title: "Cheangen Siemreap", snippet: "Cheangen Siemreap snippet"),
  //   onTap: () => print("Cheangen Siemreap"),
  // );

  // //13.3811496,103.8555559
  // Marker _gameshop = Marker(
  //   markerId: MarkerId("Gameshop Siemreap"),
  //   position: LatLng(13.3811496, 103.8555559),
  //   infoWindow: InfoWindow(
  //       title: "Gameshop Siemreap", snippet: "Gameshop Siemreap snippet"),
  //   onTap: () => print("Gameshop Siemreap"),
  // );

}

//zoome container
class ZoomContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(2),
            height: 45,
            width: 45,
            color: Colors.blue,
            child: IconButton(
                icon: Icon(Icons.zoom_in),
                color: Colors.white,
                onPressed: () {
                  current_zooom++;
                  _onZoom();
                }),
          ),
          Container(
            margin: EdgeInsets.all(2),
            height: 45,
            width: 45,
            color: Colors.blue,
            child: IconButton(
              icon: Icon(Icons.zoom_out),
              color: Colors.white,
              onPressed: () {
                current_zooom--;
                _onZoom();
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _onZoom() async {
  GoogleMapController controller = await _controller.future;
  CameraPosition newPosition = CameraPosition(
      target: LatLng(current_latitude, current_longitude), zoom: current_zooom);
  controller.animateCamera(CameraUpdate.newCameraPosition(newPosition));
}

// //userlocationbutton container
// class UserLocationButton extends StatefulWidget {
//   @override
//   _UserLocationButtonState createState() => _UserLocationButtonState();
// }

// class _UserLocationButtonState extends State<UserLocationButton> {
//   var currentLocation = LocationData;

//   _getLocation() async {
//     var location = new Location();
//     try {
//       currentLocation = await location.getLocation();

//       // print("locationLatitude: ${currentLocation["latitude"]}");
//       // print("locationLongitude: ${currentLocation["longitude"]}");
//       setState(
//           () {}); //rebuild the widget after getting the current location of the user
//     } on Exception {
//       currentLocation = null;
//     }
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     _getLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//         alignment: Alignment.bottomRight,
//         child: Padding(
//           padding: EdgeInsets.all(10),
//           child: FloatingActionButton(
//             onPressed: _getUserLocation,
//             child: Icon(Icons.gps_fixed),
//           ),
//         ));
//   }
// }

// class Place {
//   final String name;
//   final String shortDescription;
//   final String longDescription;
//   final int star;
//   final double latitude;
//   final double longitude;

//   Place({this.name, this.shortDescription, this.longDescription, this.star, this.latitude, this.longitude});

// }
