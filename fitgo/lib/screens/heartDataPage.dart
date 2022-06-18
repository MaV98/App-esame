import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HeartDataPage extends StatelessWidget {
  HeartDataPage({Key? key}) : super(key: key);

  static const route = '/heart/';
  static const routename = 'HeartDataPage';

  @override
  Widget build(BuildContext context) {
    print('${HeartDataPage.routename} built');
    Map<dynamic, dynamic> heart_data =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          // automaticallyImplyLeading: true,
          backgroundColor: Colors.red,
          title: Text('Heart activity'),
        ),
        body: Text('ciao'));
  }
}
