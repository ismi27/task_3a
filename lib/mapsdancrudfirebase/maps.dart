import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DisplayMaps extends StatefulWidget {
  final hospital;
  final String hospitalname;
  final String lat;
  final String long;
  final String ratingtotal;
  final String reviewtotal;
  final String cityname;
  final String opentime;
  final String imageUrl;
  final String name;
  final String email;
  const DisplayMaps({
    Key key,
    this.imageUrl,
    this.name,
    this.email,
    this.hospitalname,
    this.lat,
    this.long,
    this.ratingtotal,
    this.reviewtotal,
    this.cityname,
    this.opentime, this.hospital,
  }) : super(key: key);

  @override
  DisplayMapsState createState() => DisplayMapsState();
}

class DisplayMapsState extends State<DisplayMaps> {
  Completer<GoogleMapController> _controller = Completer();

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.deepPurple),
        elevation: 0,
        title: Row(
          children: [
            Text("Hospital Maps", style: TextStyle(color: Colors.black)),
            Spacer(),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.waze,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayMaps(
                            imageUrl: widget.imageUrl,
                            name: widget.name,
                            email: widget.email)));
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Colors.deepPurple),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Colors.deepPurple),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
        zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
        zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, position) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              SizedBox(width: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    'https://lh5.googleusercontent.com/p/AF1QipPlV7h4bK3a9nStESIDRcaxYpxGMxkwByGuh-5_=w427-h240-k-no',
                    double.parse(widget.lat),
                    double.parse(widget.long),
                    widget.hospitalname),
              ),
              SizedBox(width: 10.0),
            ],
          ),
        );
      },
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
            restaurantName,
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              widget.ratingtotal,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStar,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                FontAwesomeIcons.solidStarHalf,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              widget.reviewtotal,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          widget.cityname,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Open ${widget.opentime}",
          style: TextStyle(
              color: Colors.black54,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
              target:
                  LatLng(double.parse(widget.lat), double.parse(widget.long)),
              zoom: 12),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: <Marker>[
            Marker(
                markerId: MarkerId(widget.hospitalname),
                position:
                    LatLng(double.parse(widget.lat), double.parse(widget.long)),
                infoWindow: InfoWindow(title: widget.hospitalname))
          ].toSet(),
          gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
            Factory<OneSequenceGestureRecognizer>(
                () => ScaleGestureRecognizer())
          ].toSet()),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(double.parse(widget.lat), double.parse(widget.long)),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}
