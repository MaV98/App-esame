import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitgo/models/ProfiliFirebase.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/repository%20copy/databaseRepository.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/models/navBar.dart';
//import 'package:fitgo/screens/Fpage_1.dart';
//import 'package:fitgo/screens/Fpage_2.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';
import 'package:fitgo/views/classifica.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GestioneFriendsPage extends StatelessWidget {
  dynamic stepsCount;
  GestioneFriendsPage({this.stepsCount});
  // String? usern;
  // FriendsPage({this.usern});

  static const route = '/gestionefriends';
  static const routename = 'FriendsPage';

//   @override
//   Widget build(BuildContext context) {
//     print('CONTROLLO FRIENDS');

//     //final friends = Provider.of<IndicePag>(context);
//     // creation.currentCreation = creation.setCreation() + 1;
//     // final creat = creation.setCreation();
//     // print('l''indice é: ' + index.toString());
//     // print('Creation: '+creat.toString());

//              //_checkFriends(context);

//     //print('SEL BUILD: '+sel.toString());
//     //return selectSituation(context, sel);
//     return Consumer<IndicePag>(builder: (context, indice, child) {
//       dynamic sel = indice.setFriends();
//       //dynamic usern = indice.setUserName();
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Friends Page'),
//           automaticallyImplyLeading: false,
//           actions: <Widget>[
//             IconButton(
//                 onPressed: () async {
//                   deleteUser();
//                   //getUsersList();
//                   final sp = await SharedPreferences.getInstance();
//                   sp.setInt('Friends', 0);
//                   final pag = sp.getInt('indice');
//                   //Navigator.popAndPushNamed(context, FriendsPage.route);
//                   // Navigator.of(context).
//                   // push(MaterialPageRoute(builder: (context)=>HomePage(index: pag)));
//                 },
//                 icon: Icon(
//                   Icons.logout,
//                   color: Colors.white,
//                 ))
//           ],
//         ),
//         body: selectSituation(context, sel),
//       );
//     });
//   }
// }

// Widget selectSituation(BuildContext context, sel) {
//   print('SELCT SITUATION');
//   if ((sel == null) || (sel == 0)) {
//     return Fpage1();
//   } else {
//     return Fpage2();
//   }
// }

// void _checkFriends(context) async {
//   print('CONTROLLO CHECK FRIENDS');
//   //check if the username filed is set or not
//   var prov = Provider.of<IndicePag>(context);

//   final sp = await SharedPreferences.getInstance();
//   final sel = sp.getInt('Friends');
//   //final usern = sp.getString('UserName');
//   print('SEL: ' + sel.toString());
//   // if ((sel == null) || (sel == 0)){
//   //   Navigator.pushNamed(context, Fpage1.route);
//   // }else{
//   //   Navigator.pushNamed(context, Fpage2.route);
//   // }
//   //prov.currentUserName = usern!;
//   prov.currentFriends = sel;
//   //return sel;
// }

// Future deleteUser() async {
//   //final uid = AuthService().currentUser?.uid;
//   await FirebaseFirestore.instance
//       .collection('Game')
//       .doc('gs2oUsoO8JagPG4c8fOK')
//       .collection('Players')
//       .doc('nw1bv15pT4ltAjj2pagl')
//       .delete();
// }
//   // setState((){
//   //   _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
//   // }

//   // );

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//  @override
//   Future<Widget> build(BuildContext context) async {
//     print('CONTROLLO FRIENDS');

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<IndicePag>(context);

    return FutureBuilder<dynamic>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final sp = snapshot.data as SharedPreferences;
            final sel = sp.getInt('Friends');
            prov.currentFriends = sel;
            //final friends = Provider.of<IndicePag>(context);
            // creation.currentCreation = creation.setCreation() + 1;
            // final creat = creation.setCreation();
            // print('l''indice é: ' + index.toString());
            // print('Creation: '+creat.toString());

            //_checkFriends(context);

            //print('SEL BUILD: '+sel.toString());
            //return selectSituation(context, sel);
            return Consumer<IndicePag>(builder: (context, currentFrends, _) {
              dynamic sel = currentFrends.setFriends();
              //dynamic usern = indice.setUserName();
              return Scaffold(
                // appBar: AppBar(
                //   backgroundColor: Color.fromARGB(255, 255, 186, 8),
                //   title: Text('Friends Page'),
                //   automaticallyImplyLeading: false,
                //   actions: <Widget>[
                //     IconButton(
                //         onPressed: () async {
                //           deleteUser(context);
                //           //getUsersList();
                //           final sp = await SharedPreferences.getInstance();
                //           sp.setInt('Friends', 0);
                //           //final pag = sp.getInt('indice');
                //           //Navigator.pushReplacementNamed(context, GestioneFriendsPage.route);
                //           final prov_pag = Provider.of<NavBar>(context, listen: false);
                //           int pag = prov_pag.setIndex();
                //           Navigator.of(context).
                //           push(MaterialPageRoute(builder: (context)=>HomePage(index: pag)));
                //         },
                //         icon: Icon(
                //           Icons.logout,
                //           color: Colors.white,
                //         ))
                //   ],
                // ),
                body: selectSituation(context, sel, stepsCount),
              );
            });
          } else {
            return CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 186, 8),
            );
          }
        });
  }

  Widget selectSituation(BuildContext context, sel, stepsCount) {
    print('SELCT SITUATION');
    if ((sel == null) || (sel == 0)) {
      return Fpage1(stepsCount: stepsCount);
    } else {
      return Fpage2(stepsCount: stepsCount);
    }
  }

  void _checkFriends(context) async {
    print('CONTROLLO CHECK FRIENDS');
    //check if the username filed is set or not
    var prov = Provider.of<IndicePag>(context);

    final sp = await SharedPreferences.getInstance();
    final sel = sp.getInt('Friends');
    //final usern = sp.getString('UserName');
    print('SEL: ' + sel.toString());
    // if ((sel == null) || (sel == 0)){
    //   Navigator.pushNamed(context, Fpage1.route);
    // }else{
    //   Navigator.pushNamed(context, Fpage2.route);
    // }
    //prov.currentUserName = usern!;
    prov.currentFriends = sel;
    //return sel;
  }

  Future deleteUser(context) async {
    //final uid = AuthService().currentUser?.uid;
    await FirebaseFirestore.instance
        .collection('Game')
        .doc('gs2oUsoO8JagPG4c8fOK')
        .collection('Players')
        .doc('nw1bv15pT4ltAjj2pagl')
        .delete();

    //Navigator.popAndPushNamed(context, GestioneFriendsPage.route);
    //Navigator.popAndPushNamed(context, '/gestionefriends');
  }
  // setState((){
  //   _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
  // }

  // );
}

class Fpage1 extends StatelessWidget {
  dynamic stepsCount;
  Fpage1({this.stepsCount});

  //static const route = '/fpage1';
  //static const routename = 'FriendsPage1';

//   @override
//   State<situazione1> createState() => _situazione1State();
// }

//class _situazione1State extends State<situazione1> {
  @override
  Widget build(BuildContext context) {
    print('situazione1');
    var prov = Provider.of<IndicePag>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 186, 8),
          title: Text('Friends'),
          automaticallyImplyLeading: false,
        ),
        body: Consumer<IndicePag>(builder: (context, pagina, _) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromARGB(255, 255, 186, 8), width: 1),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.white,
                    ),
                  ],
                ),
                child: Text(
                    'Share the number of your steps with your friends, challenge them, climb the leaderboard and keep fit!',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            Lottie.asset('assets/105437-friends.json'),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                Color.fromARGB(255, 255, 186, 8),
              )),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                          height: 200,
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                  20,
                                  0,
                                  20,
                                  10,
                                ),
                                child: Text(
                                    'By joining the community you agree that your data relavively to your daily steps will be shared with third part entities'),
                              ),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                    Color.fromARGB(255, 255, 186, 8),
                                  )),
                                  onPressed: () async {
                                    final sp =
                                        await SharedPreferences.getInstance();
                                    sp.setInt('Friends', 1);
                                    final usern = sp.getString('UserName');
                                    uploadUser(context, usern);

                                    // Navigator.popAndPushNamed(
                                    //     context, GestioneFriendsPage.route);
                                    // final prov_page = Provider.of<NavBar>(context, listen: false);

                                    // int pag = pagina.setIndex();
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (context) => HomePage(
                                    //             index: pag, usern: usern)));

                                    stepsCount == -1
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                    index: 3, usern: usern)))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => HomePage(
                                                    index: 1, usern: usern)));
                                    //Navigator.of(context).pushNamed(HomePage.route);
                                    //Navigator.pop(context);
                                    //return selectSituation(context, sel),
                                  },
                                  child: Text('Join'))
                            ],
                          )));
                    });
              },
              child: Text('Join the community!'),
            ),
          ]);
        }));
  }
}

class Fpage2 extends StatefulWidget {
  dynamic stepsCount;
  Fpage2({this.stepsCount});

  static const route = '/fpage2';
  static const routename = 'FriendsPage2';

  @override
  State<Fpage2> createState() => _situazione2State(stepsCount: stepsCount);
}

class _situazione2State extends State<Fpage2> {
  List<Object> _listUsers = [];
  int _UserData = 0;

  dynamic stepsCount;
  _situazione2State({this.stepsCount});

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    //Future<dynamic> nonso = _readOnlineDB();
    //print(nonso);
    dynamic data1 = fitbit_data_class();
    print('situazione 2');
    return Consumer<IndicePag>(builder: (context, value, _) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Leaderboard'),
            backgroundColor: Color.fromARGB(255, 255, 186, 8),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                  onPressed: () async {
                    final sp = await SharedPreferences.getInstance();
                    sp.setInt('Friends', 0);
                    final usern = sp.getString('UserName');
                    deleteUser(usern);
                    getUsersList();
                    //Navigator.popAndPushNamed(context, GestioneFriendsPage.route);

                    //int pag = pagina.setIndex();
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (context) => HomePage(
                    //             index: pag, usern: usern)));

                    stepsCount == -1
                        ? Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                HomePage(index: 3, usern: usern)))
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                HomePage(index: 1, usern: usern)));
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ))
            ],
          ),
          body: RefreshIndicator(
              color: Color.fromARGB(255, 255, 186, 8),
              onRefresh: () async {
                List dati = await data1.fetchIstantData();
                int passi_istant = dati[0].round();
                //print(passi_istant.toString());
                final sp = await SharedPreferences.getInstance();
                final usern = sp.getString('UserName');
                int query = await dbQuery(context, usern);
                int new_tot = _UserData + query;
                int new_istant = new_tot + passi_istant;
                refreshUser(usern, new_istant, new_tot);
                getUsersList();
                getUserData(usern);
              },
              child: SafeArea(
                  child: ListView.builder(
                      itemCount: _listUsers.length,
                      itemBuilder: (context, index) {
                        return ClassificaCard(
                            _listUsers[index] as ProfiliFirebase);
                      }))));
    });
  }

  Future getUsersList() async {
    //final uid = AuthService().currentUser?.uid;
    var data = await FirebaseFirestore.instance
        .collection('Game')
        .doc('3NsG2FKtVbEkmifSuFfw')
        .collection('Players')
        .orderBy('passi', descending: true)
        .get();

    setState(() {
      _listUsers =
          List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
    });
  }

  Future getUserData(usern) async {
    //final uid = AuthService().currentUser?.uid;
    var data = await FirebaseFirestore.instance
        .collection('Game')
        .doc('3NsG2FKtVbEkmifSuFfw')
        .collection('Players')
        .doc('ProfiloApp')
        .get();

    // setState((){
    //   _listUserData = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
    // });
    var res = data.data();
    //var passi_tot = res['passi_totali'];
    int passi_tot = res!['passi_totali'];

    setState(() {
      _UserData = passi_tot;
    });
  }
}

Future refreshUser(usern, new_istant, new_tot) async {
  await FirebaseFirestore.instance
      .collection('Game')
      .doc('3NsG2FKtVbEkmifSuFfw')
      .collection('Players')
      .doc('ProfiloApp')
      .update({
    'passi': new_istant,
    'passi_totali': new_tot,
  });
}

Future deleteUser(usern) async {
  //final uid = AuthService().currentUser?.uid;
  await FirebaseFirestore.instance
      .collection('Game')
      .doc('3NsG2FKtVbEkmifSuFfw')
      .collection('Players')
      .doc(usern)
      .delete();

  // setState((){
  //   _listUsers = List.from(data.docs.map((doc) => ProfiliFirebase.fromSnapshot(doc)));
  // }

  // );
}

Future uploadUser(context, usern) async {
  //final uid = AuthService().currentUser?.uid;
  var data = await FirebaseFirestore.instance
      .collection('Game')
      .doc('3NsG2FKtVbEkmifSuFfw')
      .collection('Players')
      .doc('ProfiloApp')
      .set({
    'UserName': usern,
    'passi': 0,
    'passi_totali': 0,
  });
}

Future<int> dbQuery(context, usern) async {
  final dati = await Provider.of<DatabaseRepository>(context, listen: false)
      .findAllData(usern);

  var i = dati.length - 1;
  int passi_istant = (dati[i].passi_week) ~/ 10;

  print('lunghezza lista db: ' + dati.length.toString());
  print('Passi: ' + dati[i].passi_week.toString());
  print('Date: ' + dati[i].date_steps.toString());
  print(passi_istant);
  return passi_istant;
}
