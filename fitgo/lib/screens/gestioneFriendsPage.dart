import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/screens/Fpage_1.dart';
import 'package:fitgo/screens/Fpage_2.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GestioneFriendsPage extends StatelessWidget{
  // String? usern;
  // FriendsPage({this.usern});

  static const route = '/gestionefriends';
  static const routename = 'FriendsPage';

@override
   Widget build(BuildContext context){
    print('CONTROLLO FRIENDS');
    
    //final friends = Provider.of<IndicePag>(context);
    // creation.currentCreation = creation.setCreation() + 1;
    // final creat = creation.setCreation();
    // print('l''indice é: ' + index.toString());
    // print('Creation: '+creat.toString());
    _checkFriends(context);
    //print('SEL BUILD: '+sel.toString());
    //return selectSituation(context, sel);
    return Consumer<IndicePag>(
      builder: (context, indice, child) {
        dynamic sel = indice.setFriends();
         //dynamic usern = indice.setUserName();
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
                      //Navigator.popAndPushNamed(context, FriendsPage.route);
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
 });}}

Widget selectSituation(BuildContext context, sel){
  print('SELCT SITUATION');
    if ((sel == null) || (sel == 0)){
      return Fpage1();
    }else{
      return Fpage2();
    }
}

void _checkFriends(context) async {
    print('CONTROLLO CHECK FRIENDS');
    //check if the username filed is set or not
    var prov = Provider.of<IndicePag>(context);

    final sp = await SharedPreferences.getInstance();
    final sel = sp.getInt('Friends');
    //final usern = sp.getString('UserName');
    print('SEL: '+sel.toString());
    // if ((sel == null) || (sel == 0)){
    //   Navigator.pushNamed(context, Fpage1.route);
    // }else{
    //   Navigator.pushNamed(context, Fpage2.route);
    // }
    //prov.currentUserName = usern!;
    prov.currentFriends = sel;
    //return sel;
  
  }


Future deleteUser() async{
  //final uid = AuthService().currentUser?.uid;
  await FirebaseFirestore.instance
    .collection('Game')
    .doc('gs2oUsoO8JagPG4c8fOK')
    .collection('Players')
    .doc('nw1bv15pT4ltAjj2pagl')
    .delete();
}
  // setState((){
  //   _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
  // }

  // );
