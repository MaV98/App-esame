import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/models/ProfiliFirebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/classifica.dart';

class Fpage2 extends StatefulWidget{

  static const route = '/fpage2';
  static const routename = 'FriendsPage2';
  
  @override
  State<Fpage2> createState() => _situazione2State();
}

class _situazione2State extends State<Fpage2> {
  List<Object> _listUsers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    //Future<dynamic> nonso = _readOnlineDB();
    //print(nonso);
    print('situazione 2');
    return
    Scaffold(
      // appBar: AppBar(title: Text('Situation2'),
      // automaticallyImplyLeading: false,
      // actions: <Widget>[
      //   IconButton(onPressed: () async{
      //     deleteUser();
          
      //     getUsersList();
      //     final sp = await SharedPreferences.getInstance();
      //     sp.setInt('Friends', 0);
      //     final pag = sp.getInt('indice');
      //     Navigator.of(context).
      //     push(MaterialPageRoute(builder: (context)=>HomePage(index: pag)));
      //   }, 
      //   icon: Icon(
      //     Icons.logout,
      //     color: Colors.white,
      //   ))
      // ],),
      
      body: SafeArea(
        child: 
          ListView.builder(
            itemCount: _listUsers.length,
            itemBuilder: (context,index){
              return ClassificaCard(_listUsers[index] as ProfiliFirebase);
            }
          )
      ),
    );
}

Future getUsersList() async{
  //final uid = AuthService().currentUser?.uid;
  var data = await FirebaseFirestore.instance
    .collection('Game')
    .doc('gs2oUsoO8JagPG4c8fOK')
    .collection('Players')
    .orderBy('passi', descending: true)
    .get();

  setState((){
    _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
  }

  );

}}

Future deleteUser() async{
  //final uid = AuthService().currentUser?.uid;
  await FirebaseFirestore.instance
    .collection('Game')
    .doc('gs2oUsoO8JagPG4c8fOK')
    .collection('Players')
    .doc('nw1bv15pT4ltAjj2pagl')
    .delete();

  // setState((){
  //   _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
  // }

  // );

}


Future uploadUser(usern) async{
  //final uid = AuthService().currentUser?.uid;
  var data = await FirebaseFirestore.instance
    .collection('Game')
    .doc('gs2oUsoO8JagPG4c8fOK')
    .collection('Players')
    .doc('ProfiloProva')
    .set({
      'UserName': usern,
      'passi': 15
    }
    );

  // setState((){
  //   _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
  // }

  // );

}