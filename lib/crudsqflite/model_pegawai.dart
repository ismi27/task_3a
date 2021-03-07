class ModelPegawai {
  int _id;
  String _firstName;
  String _lastName;
  String _mobileNo;
  String _emailId;
  String _position;
  String _division;

  ModelPegawai(this._firstName, this._lastName, this._mobileNo, this._emailId,
      this._division, this._position);

  ModelPegawai.map(dynamic obj) {
    this._id = obj['id'];
    this._firstName = obj['firstname'];
    this._lastName = obj['lastname'];
    this._mobileNo = obj['mobileno'];
    this._emailId = obj['emailid'];
    this._position = obj['position'];
    this._division = obj['division'];
  }

  int get id => _id;
  String get firstname => _firstName;
  String get lastname => _lastName;
  String get mobileno => _mobileNo;
  String get emailid => _emailId;
  String get position => _position;
  String get division => _division;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['firstname'] = _firstName;
    map['lastname'] = _lastName;
    map['mobileno'] = _mobileNo;
    map['emailid'] = _emailId;
    map['position'] = _position;
    map['division'] = _division;
    return map;
  }

  ModelPegawai.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._firstName = map['firstname'];
    this._lastName = map['lastname'];
    this._mobileNo = map['mobileno'];
    this._emailId = map['emailid'];
    this._position = map['position'];
    this._division = map['division'];
  }
}
