import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '3.homescreen.dart';
import 'maps_model.dart';

class UpdateHospital extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String email;
  final HospitalModel hospital;

  UpdateHospital(this.hospital, this.imageUrl, this.name, this.email);

  @override
  State<StatefulWidget> createState() => new _UpdateHospitalState();
}

final hospitalsReference =
    FirebaseDatabase.instance.reference().child('hospitals');

class _UpdateHospitalState extends State<UpdateHospital> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _hospitalnameController;
  TextEditingController _latController;
  TextEditingController _longController;
  TextEditingController _ratingtotalController;
  TextEditingController _reviewtotalController;
  TextEditingController _citynameController;
  TextEditingController _opentimeController;

  @override
  void initState() {
    super.initState();
    _hospitalnameController =
        new TextEditingController(text: widget.hospital.hospitalname);
    _latController = new TextEditingController(text: widget.hospital.lat);
    _longController = new TextEditingController(text: widget.hospital.long);
    _ratingtotalController =
        new TextEditingController(text: widget.hospital.ratingtotal);
    _reviewtotalController =
        new TextEditingController(text: widget.hospital.reviewtotal);
    _citynameController =
        new TextEditingController(text: widget.hospital.cityname);
    _opentimeController =
        new TextEditingController(text: widget.hospital.opentime);
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
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: <Widget>[
                        Divider(),
                        Text("Hospital",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.black54)),
                        Divider(
                          indent: 40,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Hospital Name';
                            }
                            return null;
                          },
                          controller: _hospitalnameController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: "Hospital Name",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black)),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Latitude Location';
                            }
                            return null;
                          },
                          controller: _latController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Hospital Latitude",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(width: 1.5, color: Colors.black12),
                            ),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Longitude Location';
                            }
                            return null;
                          },
                          controller: _longController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Hospital Longitude",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                              borderSide:
                                  BorderSide(width: 1.5, color: Colors.black12),
                            ),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Rating Total (star)';
                            }
                            return null;
                          },
                          controller: _ratingtotalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Rating Total",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black)),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Review Total (person)';
                            }
                            return null;
                          },
                          controller: _reviewtotalController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Review Total",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black)),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input City Name';
                            }
                            return null;
                          },
                          controller: _citynameController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "City Name",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black)),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Open Time';
                            }
                            return null;
                          },
                          controller: _opentimeController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: "Open Time",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.white24)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide(
                                    width: 1.5, color: Colors.black)),
                          ),
                        ),
                        Padding(padding: new EdgeInsets.all(5.0)),
                        RaisedButton(
                            shape: StadiumBorder(),
                            child: (widget.hospital.id != null)
                                ? Text('Update')
                                : Text('Add'),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                if (widget.hospital.id != null) {
                                  hospitalsReference
                                      .child(widget.hospital.id)
                                      .set({
                                    'hospitalname':
                                        _hospitalnameController.text,
                                    'lat': _latController.text,
                                    'long': _longController.text,
                                    'ratingtotal': _ratingtotalController.text,
                                    'reviewtotal': _reviewtotalController.text,
                                    'cityname': _citynameController.text,
                                    'opentime': _opentimeController.text,
                                  }).then((_) {
                                    Navigator.pop(context);
                                  });
                                } else {
                                  hospitalsReference.push().set({
                                    'hospitalname':
                                        _hospitalnameController.text,
                                    'lat': _latController.text,
                                    'long': _longController.text,
                                    'ratingtotal': _ratingtotalController.text,
                                    'reviewtotal': _reviewtotalController.text,
                                    'cityname': _citynameController.text,
                                    'opentime': _opentimeController.text,
                                  }).then((_) {
                                    Navigator.pop(context);
                                  });
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
                            }),
                      ],
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
