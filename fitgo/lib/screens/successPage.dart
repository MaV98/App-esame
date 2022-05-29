import 'package:fitgo/screens/bottomNavBar.dart';
import 'package:fitgo/screens/shopPage.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  static const route = '/success/';
  static const routename = 'Success';

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    print('${SuccessPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(SuccessPage.routename),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              const SizedBox(height: 50.0),
              Icon(
                MdiIcons.checkboxMarkedCircleOutline,
                size: 120,
                color: Colors.green,
              ),
              const SizedBox(height: 50.0),
              Text('Payment completed',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black)),
              const SizedBox(height: 30.0),
              Text(
                  "Thank you for your purchase. Keep moving and reap the rewards!",
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                      height: 1.4),
                  textAlign: TextAlign.center),
              const SizedBox(height: 30.0),
              ElevatedButton(
                  onPressed: (() {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }),
                  child: Text('Back to home')),
            ],
          ),
        ),
      ),
    );
  }
}
