import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShopPage extends StatelessWidget {
  dynamic stepsCount;
  ShopPage({this.stepsCount});

  static const route = '/Shop/';
  static const routename = 'ShopPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(255, 30, 32, 25),
          title: Text('Shop'),
          actions: [
            //This action is used to navigate to the Cart Page
            IconButton(
                onPressed: () {
                  _toCartPage(context, stepsCount, 1);
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 30, 32, 25), width: 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.white,
                  ),
                ],
              ),
              child: stepsCount == -1
                  ? Text(
                      'Data download permission not granted. You can still visit the store, but you will not get any discount based on your activity',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
                  : Text(
                      "In total you have reached the 15000 steps goal ${stepsCount.toInt()} times this week. So you have ${5 * stepsCount.toInt()}€ discount that you can use to buy what you want! Explore our store!",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                  22,
                  0,
                  22,
                  22,
                ),
                child:
                    //SizedBox(
                    //  height: 200,
                    //This action is used to navigate to the Crypto Page
                    //child:
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(145, 200),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  //style: ElevatedButton.styleFrom(
                  //primary: Colors.white,
                  //),
                  onPressed: () {
                    _tocryptogPage(context, stepsCount, 0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Crypto',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 0, 0))),
                      //Image.asset(
                      //'assets/crypto_graph_t.png',
                      //)
                      Lottie.asset(
                          'assets/102720-cryptocurrency-bitcoin-working-loop.json')
                    ],
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(
                  22,
                  0,
                  22,
                  22,
                ),
                child:
                    //SizedBox(
                    //  height: 200,
                    //This action is used to navigate to the Store Page
                    //child:
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(145, 200),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.white,
                  // ),
                  onPressed: () {
                    _tostorePage(context, stepsCount, 0);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Clothing',
                          style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 0, 0, 0))),
                      //Image.asset(
                      //'assets/tshirt.png',
                      //)
                      Lottie.asset('assets/99745-sales-man.json')
                    ],
                  ),
                )),
          ],
        ));
  }
}

void _tocryptogPage(BuildContext context, count_step, a) {
  Navigator.pushNamed(context, '/crypto/',
      arguments: {'count_step': count_step, 'a': a});
}

void _toCartPage(BuildContext context, count_step, a) {
  Navigator.pushNamed(context, '/cart/',
      arguments: {'count_step': count_step, 'a': a});
}

void _tostorePage(BuildContext context, count_step, a) {
  Navigator.pushNamed(context, '/store/',
      arguments: {'count_step': count_step, 'a': a});
}
