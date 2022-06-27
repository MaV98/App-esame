import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/screens/gestioneFriendsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Fpage1 extends StatelessWidget{

  static const route = '/fpage1';
  static const routename = 'FriendsPage1';
  
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
                            Navigator.popAndPushNamed(context, GestioneFriendsPage.route);
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