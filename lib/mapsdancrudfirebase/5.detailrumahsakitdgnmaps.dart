import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '3.homescreen.dart';
import '8.rumahsakitmaps.dart';
import 'maps_model.dart';

class HospitalDetail extends StatefulWidget {
  final position;
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

  const HospitalDetail({
    Key key,
    this.imageUrl,
    this.name,
    this.email,
    this.lat,
    this.long,
    this.ratingtotal,
    this.reviewtotal,
    this.cityname,
    this.opentime,
    this.position,
    this.hospitalname,
  }) : super(key: key);

  @override
  _HospitalDetailState createState() => _HospitalDetailState();
}

class _HospitalDetailState extends State<HospitalDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/background2.jpg",
                ),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 0,
              title: Row(
                children: [
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                  widget.imageUrl, widget.name, widget.email)));
                    },
                  ),
                ],
              ),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 700,
                  width: 600,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Center(
                        child: Text("Detail Hospital",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54)),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.purple.withOpacity(0.8),
                              radius: 22.0,
                              child: Text(
                                '${widget.position + 1}',
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.hospitalname}',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Hospital Location: ${widget.lat},',
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${widget.long}',
                                style: new TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text('Rating Total: ${widget.ratingtotal}',
                                  style: new TextStyle(
                                    fontStyle: FontStyle.italic,
                                  )),
                              Text('Review Total: ${widget.reviewtotal} ulasan',
                                  style: new TextStyle(
                                    fontStyle: FontStyle.italic,
                                  )),
                              Text('Hospital City: ${widget.cityname}',
                                  style: new TextStyle(
                                    fontStyle: FontStyle.italic,
                                  )),
                              Text('Open : ${widget.opentime} everyday',
                                  style: new TextStyle(
                                    fontStyle: FontStyle.italic,
                                  )),
                            ],
                          ),
                        ],
                      ),
                        MyMap(hospitalname: widget.hospitalname,
                        lat: widget.lat,
                        long: widget.long,)
                    ],
                  ),
                ),
              ],
            )));
  }
}
