import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'maps_model.dart';

class MyMap extends StatefulWidget {

  MyMap({Key key, this.hospitalname, this.lat, this.long}) : super(key: key);
  final String hospitalname;
  final String lat;
  final String long;

  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                        target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
                        zoom: 11.0
                    ),
                    myLocationEnabled: true, //untuk dapetin lokasi kita,
                    onMapCreated: (controller){
                      this.mapController = controller; //mengontrol semua yang ada di map
                    },
                    markers: <Marker>[
                      Marker(markerId: MarkerId(widget.hospitalname),
                          position:LatLng(double.parse(widget.lat), double.parse(widget.long)),
                          infoWindow: InfoWindow(
                              title: widget.hospitalname
                          ))
                    ].toSet(),
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                      Factory<OneSequenceGestureRecognizer>(
                              ()=>ScaleGestureRecognizer()
                      )
                    ].toSet()
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
