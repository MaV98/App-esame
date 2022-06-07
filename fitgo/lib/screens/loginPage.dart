import 'package:fitgo/database/database.dart';
import 'package:fitgo/models/index.dart';
import 'package:fitgo/repository copy/databaseRepository.dart';
import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/screens/homepage.dart';
import 'package:fitgo/screens/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:fetch_mac/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fitgo/models/passi.dart';
import 'package:fitgo/utils/fitbit_data_class.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'LoginPage';
  @override
  State<LoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  String _name = '';
  final myController = TextEditingController();
  dynamic data = fitbit_data_class();
  Dati passi = Dati();
  IndicePag indice = IndicePag();
  

  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before showing the login page
    _checkLogin();
    // Start listening to changes.
    myController.addListener(_handleChange);
  }

  void _checkLogin() async {
    //check if the username filed is set or not
    final sp = await SharedPreferences.getInstance();
    
    if (sp.getString('UserName') != null) {
      final pag = sp.getInt('indice');
    
      Navigator.of(context).
        push(MaterialPageRoute(builder: (context)=>HomePage(index:pag)));
    } 
  } //_checkLogin

  void _handleChange() {
    setState(() {
      _name = myController.text;
      _username = myController.text;
      _password = myController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(LoginPage.routename),
      ),
      body:    
      Center(
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Benvenuto!',
                    style: TextStyle(
                        color: Colors.blue,
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
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _username = value;
                  });
                },
                onSubmitted: (String username) {},
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'UserName',
                ),
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
                onSubmitted: (String password) {},
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: Text('Login'),
                    onPressed: () async {
                      final profile = await Provider.of<DatabaseRepository>(context, listen: false)
                      .findAllUsernames(_username);
                      
                      if ((profile!.retUsername() == _username) &
                
                       (_password == profile.retPassword())) {
                        final sp = await SharedPreferences.getInstance();
                        sp.setString('UserName', _username);
                        
                        showModalBottomSheet(context: context, builder: (BuildContext context){
                          return
                            Container(
                              height: 200,
                              color: Colors.orange,
                              child: Center(child: 
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ElevatedButton(onPressed: ()async {
                                    await data.authorize(context);
                                    
                                    int pag = 1;
                                    sp.setInt('indice',pag);
                                   
                                    Navigator.of(context).
                                    push(MaterialPageRoute(builder: (context)=>HomePage(index: pag)));
                                    print('indice login: '+sp.getInt('indice').toString());
                                    
                                  }, 
                                  child: Text('Tap to authorize')),

                                  ElevatedButton(onPressed: () async{
                                    
                                    int pag1 = 0;
                                    sp.setInt('indice',pag1);
                                   
                                    Navigator.of(context).
                                    push(MaterialPageRoute(builder: (context)=>HomePage(index: pag1)));
                                    
                                  }, 
                                  child: Text('Continue without authorize'))
                                ]
                              )),
                            );
                        },);
                      } else {
                        await ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                              content: _username != 'a'
                                  ? Text('Wrong username')
                                  : Text('Wrong password')));
                      }
                    }),
              ),
              Row(
                children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
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