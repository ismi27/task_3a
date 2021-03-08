import 'package:flutter/material.dart';
import 'package:task_3a/mapsdancrudfirebase/3.homescreen.dart';
import 'db_helper.dart';
import 'model_pegawai.dart';

class FormPegawai extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String email;
  final ModelPegawai modelPegawai;

  FormPegawai(this.modelPegawai, this.imageUrl, this.name, this.email);

  @override
  _FormPegawaiState createState() => _FormPegawaiState();
}

class _FormPegawaiState extends State<FormPegawai> {
  final _formKey = GlobalKey<FormState>();
  DatabaseHelper db = new DatabaseHelper();
  TextEditingController _firstNameControler;
  TextEditingController _lastNameControler;
  TextEditingController _mobileNoControler;
  TextEditingController _emailIdControler;
  TextEditingController _positionControler;
  TextEditingController _divisionControler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _firstNameControler =
        new TextEditingController(text: widget.modelPegawai.firstname);
    _lastNameControler =
        new TextEditingController(text: widget.modelPegawai.lastname);
    _mobileNoControler =
        new TextEditingController(text: widget.modelPegawai.mobileno);
    _emailIdControler =
        new TextEditingController(text: widget.modelPegawai.emailid);
    _positionControler =
    new TextEditingController(text: widget.modelPegawai.position);
    _divisionControler =
    new TextEditingController(text: widget.modelPegawai.division);
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
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
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
                      children: [
                        Divider(),
                        Text("Employees",
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
                              return 'Please Input First Name Employee';
                            }
                            return null;
                          },
                          controller: _firstNameControler,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'First Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        Divider(),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Last Name Employee';
                            }
                            return null;
                          },
                          controller: _lastNameControler,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'Last Name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        Divider(),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Number Phone Employeee';
                            }
                            return null;
                          },
                          controller: _mobileNoControler,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              labelText: 'Number Phone',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        Divider(),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Email Address';
                            }
                            return null;
                          },
                          controller: _emailIdControler,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: 'Email Address',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        Divider(),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Position Employee';
                            }
                            return null;
                          },
                          controller: _positionControler,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'Position',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        Divider(),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please Input Division Employee';
                            }
                            return null;
                          },
                          controller: _divisionControler,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              labelText: 'Division',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                        Divider(),
                        RaisedButton(
                            shape: StadiumBorder(),
                            child: (widget.modelPegawai.id != null)
                                ? Text(
                                    'Update',
                                    style: TextStyle(color: Colors.black54),
                                  )
                                : Text(
                                    'Add',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                if (widget.modelPegawai.id != null) {
                                  db
                                      .updatePegawai(ModelPegawai.fromMap({
                                    'id': widget.modelPegawai.id,
                                    'firstname': _firstNameControler.text,
                                    'lastname': _lastNameControler.text,
                                    'mobileno': _mobileNoControler.text,
                                    'emailid': _emailIdControler.text,
                                    'position': _positionControler.text,
                                    'division': _divisionControler.text,
                                  }))
                                      .then((_) {
                                    Navigator.pop(context, 'update');
                                  });
                                } else {
                                  db
                                      .savePegawai(ModelPegawai(
                                          _firstNameControler.text,
                                          _lastNameControler.text,
                                          _mobileNoControler.text,
                                          _emailIdControler.text,
                                          _positionControler.text,
                                          _divisionControler.text,

                                  ))
                                      .then((_) {
                                    Navigator.pop(context, 'save');
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
