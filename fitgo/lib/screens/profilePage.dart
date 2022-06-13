import 'package:fitgo/screens/TodayPage.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:app_demo/screens/loginPage.dart';

import 'package:http/http.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';
  // final utente= User();

  String? _name;
  String? _email;

  TextEditingController _textEditingControllerName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    Map<dynamic, dynamic> account_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        backgroundColor: Colors.blue,
        title: Text('Profile'),
      ),
      body: ListView(children: [
        Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        height: 200.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1554629947-334ff61d85dc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Nnx8fGVufDB8fHx8&w=1000&q=80'
                                    //'https://media-exp1.licdn.com/dms/image/C4D1BAQE-k_tY7oGbfw/company-background_10000/0/1615994099909?e=2147483647&v=beta&t=AJN1_icrI13dtNppvpPeEcMBnPNJGPWFLgne6pibY1c'
                                    //'https://timelinecovers.pro/facebook-cover/download/stunning-little-flowers-facebook-cover.jpg'
                                    ))),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 117.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              account_data['account_data'].printImage()),
                        ),
                        border: Border.all(color: Colors.white, width: 6.0)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 85,
            ),
            Text(account_data['account_data'].printName(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(
                'Memeber since ${account_data['account_data'].printMemberSince()}',
                style: TextStyle(fontSize: 15))
          ],
        ),
        ListTile(
          leading: Icon(MdiIcons.cakeVariantOutline),
          title: Text('Birthday'),
          trailing: Text(account_data['account_data'].printBirthday()),
        ),
        ListTile(
          leading: Icon(MdiIcons.cardAccountDetailsOutline),
          title: Text('Age'),
          trailing: Text(account_data['account_data'].printAge()),
        ),
        ListTile(
          leading: Icon(MdiIcons.accountCircleOutline),
          title: Text('Gender'),
          trailing: Text(account_data['account_data'].printGender()),
        ),
        ListTile(
          leading: Icon(MdiIcons.humanMaleHeightVariant),
          title: Text('Height'),
          trailing: Text(account_data['account_data'].printHeight() + ' cm'),
        ),
        ListTile(
          leading: Icon(MdiIcons.weightKilogram),
          title: Text('Weight'),
          trailing: Text(account_data['account_data'].printWeight() + ' kg'),
        ),
        ListTile(
          leading: Icon(MdiIcons.walk),
          title: Text('Stride length walking'),
          trailing: Text(
              account_data['account_data'].printstrideLengthWalking() + ' cm'),
        ),
        ListTile(
          leading: Icon(MdiIcons.run),
          title: Text('Stride length running'),
          trailing: Text(
              account_data['account_data'].printstrideLengthRunning() + ' cm'),
        ),
        ListTile(
          leading: Icon(MdiIcons.axisArrow),
          title: Text('Measurement Unit'),
          trailing: Text(account_data['account_data'].printMeasurementUnit()),
        ),
        ListTile(
          leading: Icon(MdiIcons.mapClockOutline),
          title: Text('Time zone'),
          trailing: Text(account_data['account_data'].printtimezone()),
        ),
        ListTile(
          leading: Icon(MdiIcons.calendarWeekendOutline),
          title: Text('Start day of week'),
          trailing: Text(account_data['account_data'].printstartDayOfWeek()),
        ),
        ListTile(
          leading: Icon(MdiIcons.shieldStarOutline),
          title: Text('Ambassador'),
          trailing: Text(account_data['account_data'].printAmbassador()),
        ),
      ]),
    );
  } //build

} //ProfilePage