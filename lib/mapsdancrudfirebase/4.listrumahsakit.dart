import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '3.homescreen.dart';
import '5.detailrumahsakitdgnmaps.dart';
import '7.editdata.dart';
import 'maps.dart';
import 'maps_model.dart';

class HospitalList extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String email;

  const HospitalList({Key key, this.imageUrl, this.name, this.email})
      : super(key: key);

  @override
  _HospitalListState createState() => _HospitalListState();
}

final hospitalsReference =
    FirebaseDatabase.instance.reference().child('hospitals');

class _HospitalListState extends State<HospitalList> {
  List<HospitalModel> items;
  StreamSubscription<Event> _onHospitalAddedSubscription;
  StreamSubscription<Event> _onHospitalChangedSubscription;

  @override
  void initState() {
    super.initState();

    items = List();
    _onHospitalAddedSubscription =
        hospitalsReference.onChildAdded.listen(_onHospitalAdded);
    _onHospitalChangedSubscription =
        hospitalsReference.onChildChanged.listen(_onHospitalUpdated);
  }

  @override
  void dispose() {
    _onHospitalAddedSubscription.cancel();
    _onHospitalChangedSubscription.cancel();

    super.dispose();
  }

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
          body: _showHospitalList(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple.withOpacity(0.8),
            child: Icon(Icons.add, color: Colors.white,),
              onPressed: () => _createNewHospital(context),
            ),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat),
    );
  }

  void _onHospitalAdded(Event event) {
    setState(() {
      items.add(HospitalModel.fromSnapshot(event.snapshot));
    });
  }

  void _deleteHospital(
      BuildContext context, HospitalModel hospital, int position) async {
    await hospitalsReference.child(hospital.id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _onHospitalUpdated(Event event) {
    var oldHospitalValue =
        items.singleWhere((hospital) => hospital.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldHospitalValue)] =
          new HospitalModel.fromSnapshot(event.snapshot);
    });
  }

  void _navigateToHospital(BuildContext context, HospitalModel hospital) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UpdateHospital(
              hospital, widget.imageUrl, widget.name, widget.email)),
    );
  }

  void _createNewHospital(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UpdateHospital(
              HospitalModel(null, '', '', '', '', '', '', ''),
              widget.imageUrl,
              widget.name,
              widget.email)),
    );
  }

  Widget _showHospitalList() {
    if (items.length > 0) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, int position) {
              HospitalModel hospital = items[position];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Divider(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HospitalDetail(
                                  hospitalname: items[position].hospitalname,
                                  lat: items[position].lat,
                                  long: items[position].long,
                                  ratingtotal: items[position].ratingtotal,
                                  reviewtotal: items[position].reviewtotal,
                                  cityname: items[position].cityname,
                                  opentime: items[position].opentime,
                                  position: position,
                                ),
                              ));
                        },
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.purple.withOpacity(0.8),
                                    radius: 22.0,
                                    child: Text(
                                      '${position + 1}',
                                      style: TextStyle(
                                          fontSize: 24.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '${hospital.hospitalname}',
                                      softWrap: true,
                                      style: TextStyle(
                                          fontSize: 22.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '${hospital.cityname}',
                                      style: new TextStyle(
                                        fontSize: 18.0,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                          FontAwesomeIcons.eraser,
                                          size: 20,
                                          color: Colors.black),
                                      onPressed: () => _deleteHospital(
                                          context, items[position], position),
                                    ),
                                    Text("Hapus")
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                        icon: const Icon(
                                          FontAwesomeIcons.waze,
                                          color: Colors.black,
                                          size: 20,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DisplayMaps(
                                                        imageUrl:
                                                        widget.imageUrl,
                                                        name: widget.name,
                                                        email: widget.email,
                                                        hospitalname:
                                                        items[position]
                                                            .hospitalname,
                                                        lat: items[position]
                                                            .lat,
                                                        long: items[position]
                                                            .long,
                                                        ratingtotal:
                                                        items[position]
                                                            .ratingtotal,
                                                        reviewtotal:
                                                        items[position]
                                                            .reviewtotal,
                                                        cityname:
                                                        items[position]
                                                            .cityname,
                                                        opentime:
                                                        items[position]
                                                            .opentime,
                                                      )));
                                        }),
                                    Text("Maps"),
                                  ],
                                ),
                                Column(
                                  children: [
                                    IconButton(
                                      icon: const Icon(FontAwesomeIcons.edit,
                                          color: Colors.black),
                                      onPressed: () => _navigateToHospital(
                                          context, items[position]),
                                    ),
                                    Text("Edit"),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
      );
    } else {
      return Center(
        child: Text("No Hospital", ),
      );
    }
  }
}
