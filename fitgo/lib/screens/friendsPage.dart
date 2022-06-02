//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:app_demo/screens/loginPage.dart';
import 'package:fitgo/screens/TodayPage.dart';

class FriendsPage extends StatelessWidget {
  final Map<String, dynamic>? data;
  //FriendsPage({Key? key, this.data}) : super(key: key);
  FriendsPage({this.data});

  static const route = '/friends/';
  static const routename = 'FriendsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF2196F3),
          title: Text(FriendsPage.routename),
        ),
        body: Column(children: [
          Text('Friends page'),
          ElevatedButton(
              onPressed: () {
                _updateDB(data);
              },
              child: Text('Upload dati'))
        ]));
  }
}

void _updateDB(passitotali) {
  //return steps.add({'passi': passi_totali.})
  //FirebaseFirestore.instance.collection('Passi').snapshots();
  //var check = FirebaseFirestore.instance.collection('Passi');

  Map<String, dynamic> toadd = {'Passi': passitotali};
  //FirebaseFirestore.instance.collection('Passi').add(toadd);
}
