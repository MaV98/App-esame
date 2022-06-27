import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/models/ProfiliFirebase.dart';
import 'package:fitgo/models/passi.dart';
import 'package:fitgo/screens/homepage.dart';
import 'package:fitgo/screens/TodayPage.dart';
import 'package:fitgo/views/classifica.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/index.dart';

class FriendsPage extends StatelessWidget {
  // String? usern;
  // FriendsPage({this.usern});

  static const route = '/friends';
  static const routename = 'FriendsPage';

  @override
  void _checkFriends(context) async {
    print('CONTROLLO CHECK FRIENDS');
    //check if the username filed is set or not
    var prov = Provider.of<IndicePag>(context);

    final sp = await SharedPreferences.getInstance();
    final sel = sp.getInt('Friends');
    //final usern = sp.getString('UserName');
    print('SEL: '+sel.toString());
    //prov.currentUserName = usern!;
    prov.currentFriends = sel;
    //return sel;
  
  }
  @override
   Widget build(BuildContext context){
    print('CONTROLLO FRIENDS');
    return
    FutureBuilder(
      initialData: null,
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot){
        if (snapshot.hasData){
          final sp = snapshot.data as Map<String,dynamic>;
          final sel = sp['Friends'];
          print(sel);
    //final friends = Provider.of<IndicePag>(context);
    // creation.currentCreation = creation.setCreation() + 1;
    // final creat = creation.setCreation();
    // print('l''indice é: ' + index.toString());
    // print('Creation: '+creat.toString());
    //_checkFriends(context);
    //print('SEL BUILD: '+sel.toString());
    //return selectSituation(context, sel);
    // return Consumer<IndicePag>(
    //   builder: (context, indice, child) {
    //     dynamic sel = indice.setFriends();
    //     //dynamic usern = indice.setUserName();
    //       return 
          return
            Scaffold(
              appBar: AppBar(
                  title: Text('Friends Page'),
                  automaticallyImplyLeading: false,
                  actions: <Widget>[
                    IconButton(onPressed: () async{
                      deleteUser();         
                      //getUsersList();
                      final sp = await SharedPreferences.getInstance();
                      sp.setInt('Friends', 0);
                      final pag = sp.getInt('indice');
                      Navigator.popAndPushNamed(context, FriendsPage.route);
                      // Navigator.of(context).
                      // push(MaterialPageRoute(builder: (context)=>HomePage(index: pag)));
                    }, 
                      icon: Icon(
                        Icons.logout,
                          color: Colors.white,
                      ))
                  ],
              ),
              body: selectSituation(context, sel),
            );
          
      }else{
        return Center(
          child: CircularProgressIndicator(),
        );
      }}
      );
 }
}

Widget selectSituation(BuildContext context, sel){
  print('SELCT SITUATION');
    if ((sel == null) || (sel == 0)){
      return situazione1();
    }else{
      return situazione2();
    }
}

class situazione1 extends StatelessWidget{
  
//   @override
//   State<situazione1> createState() => _situazione1State();
// }

//class _situazione1State extends State<situazione1> {
  @override
  Widget build(BuildContext context) {
    print('situazione1');
    var prov = Provider.of<IndicePag>(context);
    return
        Scaffold(
          // appBar: AppBar(
          //   title: Text('Situation1'),
          //   automaticallyImplyLeading: false,
          // ),
          body: Center(
            child: ElevatedButton(
              onPressed: (){
              
              showModalBottomSheet(context: context,
              builder: (BuildContext context) {
                return
               Container(
                  child: 
                  Column(
                      children: <Widget>[
                        Text('By joining the community you agree that your data relavively to your daily steps will be shared with third part entities'),
                        ElevatedButton(
                          onPressed: () async{
                            final sp = await SharedPreferences.getInstance();
                            sp.setInt('Friends', 1);
                            final usern = sp.getString('UserName');
                            uploadUser(usern);
                            //Navigator.popAndPushNamed(context, FriendsPage.route);
                            ///final pag = sp.getInt('indice');
                            // Navigator.of(context).
                            //   push(MaterialPageRoute(builder: (context)=>HomePage(index: pag)));
                            //Navigator.of(context).pushNamed(FriendsPage.route);
                            //Navigator.pop(context);
                            //return selectSituation(context, sel),
                          }, 
                          child: Text('Join'))
                      ],
                    )
                
                );}
              );
            },
            child: Text('Join the community!'),),
          ),);
}
}

class situazione2 extends StatefulWidget{
  
  @override
  State<situazione2> createState() => _situazione2State();
}

class _situazione2State extends State<situazione2> {
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