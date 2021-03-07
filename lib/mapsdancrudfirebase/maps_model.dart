import 'package:firebase_database/firebase_database.dart';

class HospitalModel {
  String _id;
  String _hospitalname;
  String _lat;
  String _long;
  String _ratingtotal;
  String _reviewtotal;
  String _cityname;
  String _opentime;

  HospitalModel(this._id, this._hospitalname, this._lat, this._long,
      this._ratingtotal, this._reviewtotal, this._cityname, this._opentime);

  HospitalModel.map( dynamic obj) {
    this._id = obj['id'];
    this._hospitalname = obj['hospitalname'];
    this._lat = obj['lat'];
    this._long = obj['long'];
    this._ratingtotal = obj['ratingtotal'];
    this._reviewtotal = obj['reviewtotal'];
    this._cityname = obj['cityname'];
    this._opentime = obj['opentime'];
  }

  String get id => _id;
  String get hospitalname => _hospitalname;
  String get lat => _lat;
  String get long => _long;
  String get ratingtotal => _ratingtotal;
  String get reviewtotal => _reviewtotal;
  String get cityname => _cityname;
  String get opentime => _opentime;

  HospitalModel.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _hospitalname = snapshot.value['hospitalname'];
    _lat = snapshot.value['lat'];
    _long = snapshot.value['long'];
    _ratingtotal = snapshot.value['ratingtotal'];
    _reviewtotal = snapshot.value['reviewtotal'];
    _cityname = snapshot.value['cityname'];
    _opentime = snapshot.value['opentime'];
  }
}
