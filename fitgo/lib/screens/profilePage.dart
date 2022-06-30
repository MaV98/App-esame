import 'package:fitgo/repository%20copy/databaseRepository.dart';
import 'package:fitgo/screens/TodayPage.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
//import 'package:app_demo/screens/loginPage.dart';

import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  static const route = '/profile/';
  static const routename = 'ProfilePage';
  // final utente= User();

  @override
  Widget build(BuildContext context) {
    print('${ProfilePage.routename} built');
    Map<dynamic, dynamic> account_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        backgroundColor: Color.fromARGB(255, 0, 105, 140),
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
                          image: account_data['account_data'].isEmptyAccount()
                              ? NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvFoqpTEH65bi07UUM1Osre6jjvLzRi7Tb-6DP_ee5k3DXs6wur3_qHZHG0o4KC2ZQIxw&usqp=CAU')
                              : NetworkImage(
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
            account_data['account_data'].isEmptyAccount()
                ? Text('Data not available')
                : Column(
                    children: [
                      Text(account_data['account_data'].printName(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                      Text(
                          'Memeber since ${account_data['account_data'].printMemberSince()}',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
        Row(
              children: <Widget>[
                FutureBuilder<Color>(
                  initialData: null,
                  future: _defineColor(passi_ieri),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return
                        IconButton(
                          icon: const Icon(Icons.ten_k),
                          color: snapshot.data,
                          iconSize: 20.0,
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Like an AT-AT',textAlign: TextAlign.center),
                                content: Text('You have walked for 15k steps in one day! Impressive! Be careful not to trip over any cables'),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                            },
                            child: Text("Ok"),
                              )]
                            ));
                            //Card(child: Text('You walked 10k steps'),);
                          });}
                          else{
                            return Center(child: CircularProgressIndicator());
                          }
                          }),
                FutureBuilder<Color>(
                  initialData: null,
                  future: _defineColor1(passi_tot),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return
                        IconButton(
                          icon: const Icon(Icons.king_bed),
                          color: snapshot.data,
                          iconSize: 20.0,
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Unstoppable',textAlign: TextAlign.center),
                                content: Text("You have reached 100K steps!! Here's the king's bed, rest."),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                            },
                            child: Text("Ok"),
                              )]
                            ));
                            //Card(child: Text('You walked 10k steps'),);
                          });}
                          else{
                            return Center(child: CircularProgressIndicator());
                          }
                          }),
              ],)
          ],
        ),
        ListTile(
          leading: Icon(
            MdiIcons.cakeVariantOutline,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Birthday'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printBirthday()),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.cardAccountDetailsOutline,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Age'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printAge()),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.accountCircleOutline,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Gender'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printGender()),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.humanMaleHeightVariant,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Height'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printHeight() + ' cm'),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.weightKilogram,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Weight'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printWeight() + ' kg'),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.walk,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Stride length walking'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printstrideLengthWalking() +
                  ' cm'),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.run,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Stride length running'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printstrideLengthRunning() +
                  ' cm'),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.axisArrow,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Measurement Unit'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printMeasurementUnit()),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.mapClockOutline,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Time zone'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printtimezone()),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.calendarWeekendOutline,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Start day of week'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printstartDayOfWeek()),
        ),
        ListTile(
          leading: Icon(
            MdiIcons.shieldStarOutline,
            color: Color.fromARGB(255, 0, 105, 140),
          ),
          title: Text('Ambassador'),
          trailing: account_data['account_data'].isEmptyAccount()
              ? Text('Data not available')
              : Text(account_data['account_data'].printAmbassador()),
        ),
      ]),
    );
  } //build

Future<Color> _defineColor(passi)async {
    final sp = await SharedPreferences.getInstance();
    if (passi >= 15000){
      
      sp.setInt('Badge1', 1);
      return const Color.fromARGB(255, 66, 165, 245);
    }else if (sp.getInt('Badge1') == 1){
      return const Color.fromARGB(255, 66, 165, 245);
    }else{
      return const Color.fromARGB(150, 50, 50, 50);
    }
  }

  Future<Color> _defineColor1(passi)async {
    final sp = await SharedPreferences.getInstance();
    if (passi >= 100000){
      
      sp.setInt('Badge2', 1);
      return Color.fromARGB(255, 243, 218, 37);
    }else if (sp.getInt('Badge2') == 1){
      return const Color.fromARGB(255, 243, 218, 37);
    }else{
      return const Color.fromARGB(150, 50, 50, 50);
    }
  }




Future<List<dynamic>> dbQuery(context) async {
  final sp = await SharedPreferences.getInstance();
  String? usern = sp.getString('UserName');
    final dati = await Provider.of<DatabaseRepository>(context, listen: false)
        .findAllData(usern!);
    List<dynamic> to_plot = [];
    List<int> passi = [];
    
    int passi_tot = 0;
    for (var i = dati.length - 1; i >= dati.length - 7; i--) {
      int to_add = dati[i].passi_week ~/10;
      passi_tot = passi_tot + to_add;
    }
    int passi_ieri = dati[dati.length-1].passi_week;
    
    to_plot.add(passi_ieri);
    to_plot.add(passi_tot);
    
    // print('lunghezza lista db: '+dati.length.toString());
    // print('Passi: '+dati[7].passi_week.toString());
    // print('Date: '+dati[0].date_steps.toString());
    return to_plot;
  }
} //ProfilePage

//ProfilePage