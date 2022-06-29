//import 'dart:html';

import 'package:fitgo/models/ProfiliFirebase.dart';
import 'package:fitgo/screens/friendsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ClassificaCard extends StatelessWidget {
  final ProfiliFirebase _friendsPage;
  ClassificaCard(this._friendsPage);

  @override
  Widget build(BuildContext context) {
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
                  child: Text("User: ${_friendsPage.UserName}"))
            ],
          ),
          Row(
            children: [
              Icon(MdiIcons.shoePrint, color: Color.fromARGB(255, 255, 186, 8)),
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Steps: ${_friendsPage.passi}"))
            ],
          )
        ],
      ),
    )));
  }
}
