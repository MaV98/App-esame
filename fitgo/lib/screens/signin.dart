import 'package:fitgo/database/database.dart';
import 'package:fitgo/database/entities/profile.dart';
import 'package:fitgo/repository copy/databaseRepository.dart';
//import 'package:fitgo/screens/loginPage.dart';
import 'package:fitgo/screens/loginPage_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({Key? key}) : super(key: key);

  static const route = '/signin';
  static const routename = 'SigninPage';

  @override
  State<SigninPage> createState() => _SigninPageState();
}


class _SigninPageState extends State<SigninPage> {
  String _name = '';

  String _username = '';

  String _password = '';

  final myController = TextEditingController();


  @override
  void initState() {
    super.initState();
    //Check if the user is already logged in before showing the login page
    //_checkLogin();
    // Start listening to changes.
    myController.addListener(_handleChange);
  }

  void _handleChange() {
    setState(() {
      _name = myController.text;
      _username = myController.text;
      _password = myController.text;
    });
  }

  // dynamic data = fitbit_data_class();
  @override
  Widget build(BuildContext context) {
    //var provider = Provider.of<AppDatabase>(context);
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(SigninPage.routename),
      ),
      body: Center(
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _name = value;
                  });
                },
                onSubmitted: (String name) {},
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              TextField(
                onChanged: (String value) {
                  setState(() {
                    _username = value;
                  });
                },
                onSubmitted: (String username) {},
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
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
                    child: Text('Create account'),
                    onPressed: () async {
                      //final profilo = Profile(_name, _username, _password);
                      await Provider.of<DatabaseRepository>(context, listen: false)
                      .insertProfile(Profile(null,_name,_username,_password));
                      Navigator.pushReplacementNamed(context, LoginPage.route);
                        },),),],),],
                      
                    ),
              ),);}
       
  }