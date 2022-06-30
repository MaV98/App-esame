//import 'dart:html';

import 'package:fitgo/models/ProfiliFirebase.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassificaCard extends StatelessWidget {
  final ProfiliFirebase _friendsPage;
  ClassificaCard(this._friendsPage);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final sp = snapshot.data as SharedPreferences;
            final usern = sp.getString('UserName');
            return Container(
                child: Card(
                    child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        MdiIcons.account,
                        color: Color.fromARGB(255, 255, 186, 8),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: _friendsPage.UserName == usern
                              ? Text("User: ${_friendsPage.UserName} (You)")
                              : Text('User: ${_friendsPage.UserName}'))
                    ],
                  ),
                  Row(
                    children: [
                      Icon(MdiIcons.shoePrint,
                          color: Color.fromARGB(255, 255, 186, 8)),
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Steps: ${_friendsPage.passi}"))
                    ],
                  )
                ],
              ),
            )));
          } else {
            return CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 186, 8),
            );
          }
        });

//     return Container(
//         child: Card(
//             child: Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Icon(
//                 MdiIcons.account,
//                 color: Color.fromARGB(255, 255, 186, 8),
//               ),
//               Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text("User: ${_friendsPage.UserName}"))
//             ],
//           ),
//           Row(
//             children: [
//               Icon(MdiIcons.shoePrint, color: Color.fromARGB(255, 255, 186, 8)),
//               Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Text("Steps: ${_friendsPage.passi}"))
//             ],
//           )
//         ],
//       ),
//     )));
  }
}
