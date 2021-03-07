//import 'package:flutter/material.dart';
//import 'package:task_3a/crudsqflite/db_helper.dart';
//import 'package:task_3a/crudsqflite/detailpage.dart';
//import 'package:task_3a/crudsqflite/form_pegawai.dart';
//import 'package:task_3a/crudsqflite/model_pegawai.dart';
//import 'package:task_3a/mapsdancrudfirebase/3.homescreen.dart';
//
//
//class ListPegawai extends StatefulWidget {
//  final String imageUrl;
//  final String name;
//  final String email;
//
//  const ListPegawai({Key key, this.imageUrl, this.name, this.email})
//      : super(key: key);
//
//  @override
//  _ListPegawaiState createState() => _ListPegawaiState();
//}
//
//class _ListPegawaiState extends State<ListPegawai> {
//  List<ModelPegawai> items = new List();
//  DatabaseHelper db = new DatabaseHelper();
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    db.getAllPegawai().then((pegawais) {
//      setState(() {
//        pegawais.forEach((pegawai) {
//          items.add(ModelPegawai.fromMap(pegawai));
//        });
//      });
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage(
//                "assets/background2.jpg",
//              ),
//              fit: BoxFit.cover)),
//      child: Scaffold(
//          backgroundColor: Colors.transparent,
//          appBar: AppBar(
//            backgroundColor: Colors.transparent,
//            iconTheme: IconThemeData(color: Colors.white),
//            elevation: 0,
//            title: Row(
//              children: [
//                Spacer(),
//                IconButton(
//                  icon: Icon(
//                    Icons.home,
//                    size: 40,
//                    color: Colors.white,
//                  ),
//                  onPressed: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => HomePage(
//                                widget.imageUrl, widget.name, widget.email)));
//                  },
//                ),
//              ],
//            ),
//          ),
//          body: Container(
//            decoration: BoxDecoration(
//                color: Colors.white,
//                borderRadius: BorderRadius.only(
//                    topLeft: Radius.circular(40), topRight: Radius.circular(40))),
//            child: ListView.builder(
//                itemCount: items.length,
//                itemBuilder: (context, index) {
//                  return ListTile(
//                    contentPadding: EdgeInsets.only(left: 16),
//                    title: Text(
//                      '${items[index].firstname} ${items[index].lastname}',
//                      style: TextStyle(
//                          fontSize: 18,
//                          fontStyle: FontStyle.italic,
//                          color: Colors.deepOrangeAccent),
//                    ),
//                    subtitle: Text(
//                      '${items[index].emailid}',
//                    ),
//                    onTap: () {
//                      _navigateToPegawai(context, items[index]);
//                    },
//                    trailing: IconButton(
//                      icon: Icon(Icons.delete),
//                      onPressed: () {
//                        AlertDialog hapus = AlertDialog(
//                          title: Text('Information'),
//                          content: Container(
//                            height: 100.0,
//                            child: Column(
//                              children: <Widget>[
//                                Text(
//                                    'Apakah anda yakin ingin hapus data ${items[index].firstname}')
//                              ],
//                            ),
//                          ),
//                          actions: <Widget>[
//                            FlatButton(
//                              child: Text('yes'),
//                              onPressed: () {
//                                _deletePegawai(context, items[index], index);
//                                Navigator.pop(context);
//                              },
//                            ),
//                            FlatButton(
//                              child: Text('no'),
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                            ),
//                          ],
//                        );
//                        showDialog(context: context, child: hapus);
//                      },
//                    ),
//                    leading: IconButton(
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => PageDetail(
//                                    pertama: items[index].firstname,
//                                    terakhir: items[index].lastname,
//                                    phone: items[index].mobileno,
//                                    email: items[index].emailid)));
//                      },
//                      icon: Icon(Icons.visibility),
//                    ),
//                  );
//                }),
//          ),
//          floatingActionButton: FloatingActionButton(
//              child: Icon(Icons.add),
//              backgroundColor: Colors.deepPurple,
//              onPressed: () {
//                _createNewPegawai(context);
//              }),
//          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//          floatingActionButtonLocation:
//          FloatingActionButtonLocation.centerFloat
//      ),
//    );
//  }
//
//  _deletePegawai(BuildContext context, ModelPegawai pegawai, int position) {
//    db.deletePegawai(pegawai.id).then((pegawais) {
//      setState(() {
//        items.removeAt(position);
//      });
//    });
//  }
//
//  void _navigateToPegawai(BuildContext context, ModelPegawai pegawai) async {
//    String result = await Navigator.push(
//        context, MaterialPageRoute(builder: (context) => FormPegawai(pegawai,  widget.imageUrl, widget.name, widget.email), ));
//    if (result == 'update') {
//      db.getAllPegawai().then((pegawais) {
//        setState(() {
//          items.clear();
//          pegawais.forEach((pegawai) {
//            items.add(ModelPegawai.fromMap(pegawai));
//          });
//        });
//      });
//    }
//  }
//
//  void _createNewPegawai(BuildContext context) async {
//    String result = await Navigator.push(
//        context,
//        MaterialPageRoute(
//            builder: (context) => FormPegawai(ModelPegawai('', '', '', '','',''),  widget.imageUrl, widget.name, widget.email)));
//    if (result == 'save') {
//      db.getAllPegawai().then((pegawais) {
//        setState(() {
//          items.clear();
//          pegawais.forEach((pegawai) {
//            items.add(ModelPegawai.fromMap(pegawai));
//          });
//        });
//      });
//    }
//  }
//}
