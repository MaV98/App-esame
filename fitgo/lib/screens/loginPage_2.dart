import 'package:fitgo/database/database.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/models/profileCheck.dart';
import 'package:fitgo/repository copy/databaseRepository.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/screens/homepage.dart';
import 'package:fitgo/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
//import 'package:fetch_mac/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitgo/models/passi.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';

  String _username = '';
  String _password = '';
  String _name = '';
  final myController = TextEditingController();
  dynamic data = fitbit_data_class();
  Dati passi = Dati();
  IndicePag indice = IndicePag();

  void _checkLogin(context) async {
    //check if the username filed is set or not
    final sp = await SharedPreferences.getInstance();

    if (sp.getString('UserName') != null) {
      final pag = sp.getInt('indice');
      final usern = sp.getString('UserName');

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(index: pag, usern: usern)));
    }
  } //_checkLogin

  // void _handleChange() {
  //   setState(() {
  //     _name = myController.text;
  //     _username = myController.text;
  //     _password = myController.text;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<IndicePag>(context);
    provider.currentCreation = 0;
    _checkLogin(context);

    print('LOGIN PAGE Built');
    //var provider = Provider.of<IndicePag>(context);
    var providerPC = Provider.of<ProfileCheck>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 105, 140),
        automaticallyImplyLeading: false,
        title: Text('Login'),
      ),
      body: Center(
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Welcome!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 105, 140),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Log in ',
                    style: TextStyle(fontSize: 20),
                  )),
              Lottie.asset('assets/72874-user-profile-v2.json'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (String value) {
                    providerPC.currentUsername = value;
                    //_username = value;
                  },
                  onSubmitted: (String username) {},
                  //enabled: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 105, 140)),
                    ),
                    labelText: 'UserName',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (String value) {
                    providerPC.currentPassword = value;
                    //_password = value;
                  },
                  onSubmitted: (String password) {},
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 105, 140)),
                    ),
                    labelText: 'Password',
                  ),
                ),
              ),
              Consumer<ProfileCheck>(builder: (context, profileCheck, _) {
                return Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                      child: Text('Login'),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 0, 105, 140),
                        ),
                      ),
                      onPressed: () async {
                        print(providerPC.retUsername());
                        print(providerPC.retPassword());
                        //var provCreation = Provider.of<IndicePag>(context);
                        //provider.currentCreation = 0;

                        final profile = await Provider.of<DatabaseRepository>(
                                context,
                                listen: false)
                            .findAllUsernames(providerPC.retUsername());
                        print('prova');
                        print(profile!.retUsername());

                        if ((profile.retUsername() ==
                                providerPC.retUsername()) & //_username

                            (providerPC.retPassword() ==
                                profile.retPassword())) {
                          //_password
                          //provider.currentUserName(_username);

                          final sp = await SharedPreferences.getInstance();
                          sp.setString(
                              'UserName', providerPC.retUsername()); //_username

                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Color.fromARGB(255, 111, 210, 255),
                                child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                      ElevatedButton(
                                          onPressed: () async {
                                            //provider.currentCreation = 0;
                                            await data.authorize(context);

                                            int pag = 1;
                                            sp.setInt('indice', pag);

                                            //rovider.currentCreation = 0;
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) => HomePage(
                                                        index: pag,
                                                        usern: providerPC
                                                            .retUsername()))); //_username
                                            print('indice login: ' +
                                                sp.getInt('indice').toString());

                                            //var prov = Provider.of<IndicePag>(context);
                                          },
                                          child: Text('Tap to authorize'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Color.fromARGB(255, 0, 105, 140),
                                            ),
                                          )),
                                      ElevatedButton(
                                          onPressed: () async {
                                            int pag1 = 0;
                                            sp.setInt('indice', pag1);

                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(index: pag1)));
                                          },
                                          child: Text(
                                              'Continue without authorize'),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Color.fromARGB(255, 0, 105, 140),
                                            ),
                                          ))
                                    ])),
                              );
                            },
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                            ..removeCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: (_username != profile?.retUsername()) &
                                        (_password != profile?.retPassword())
                                    ? Text('Wrong username and password',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold))
                                    : _username != profile?.retUsername()
                                        ? Text('Wrong username',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                        : Text('Wrong password',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))));
                          // await ScaffoldMessenger.of(context)
                          //   ..removeCurrentSnackBar()
                          //   ..showSnackBar(SnackBar(
                          //       content: _username != 'a'
                          //           ? Text('Wrong username')
                          //           : Text('Wrong password')));
                        }
                      }),
                );
              }),
              Row(
                children: <Widget>[
                  const Text('Don’t you have an account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 105, 140)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, SigninPage.route);
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ]),
      ),
    );
  } //build

} //ProfilePage