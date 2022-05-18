import 'package:flutter/material.dart';
import 'package:fitgo/screens/homePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final myController = TextEditingController();

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
    if (sp.getString('username') != null) {
      //If username is set, show the homepage
      Navigator.of(context).pushReplacementNamed(HomePage.route);
    } //if
  } //_checkLogin

  void _handleChange() {
    setState(() {
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
      body: Center(
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
                  labelText: 'User Name',
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
                      if ((_username == 'a') & //bug@expert.com
                          (_password == 'b')) {
                        final sp = await SharedPreferences.getInstance();
                        sp.setString('username', _username);
                        //5TrNgP5Wd
                        Navigator.pushNamed(context, '/homepage/');
                        //Navigator.of(context).pushReplacementNamed(HomePage.route);
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
                      //signup screen
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