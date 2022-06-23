import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({Key? key}) : super(key: key);

  static const route = '/Shop/';
  static const routename = 'ShopPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF2196F3),
          title: Text(ShopPage.routename),
          actions: [
            //This action is used to navigate to the Cart Page
            IconButton(
                onPressed: () {
                  _toCartPage(context);
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
                    color: Color.fromARGB(255, 199, 205, 210), width: 1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.white,
                  ),
                ],
              ),
              child: Text(
                  "In total you have reached the 15000 steps goal x times this week. So you have 5x euro discount that you can use to buy what you want! Explore our store!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(
                  18,
                  0,
                  18,
                  18,
                ),
                child:
                    //SizedBox(
                    //  height: 200,
                    //This action is used to navigate to the Crypto Page
                    //child:
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(155, 200),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  //style: ElevatedButton.styleFrom(
                  //primary: Colors.white,
                  //),
                  onPressed: () {
                    _tocryptogPage(context);
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
                  18,
                  0,
                  18,
                  18,
                ),
                child:
                    //SizedBox(
                    //  height: 200,
                    //This action is used to navigate to the Store Page
                    //child:
                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(155, 200),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  // style: ElevatedButton.styleFrom(
                  //   primary: Colors.white,
                  // ),
                  onPressed: () {
                    _tostorePage(context);
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

void _tocryptogPage(BuildContext context) {
  Navigator.pushNamed(context, '/crypto/');
}

void _toCartPage(BuildContext context) {
  Navigator.pushNamed(context, '/cart/');
}

void _tostorePage(BuildContext context) {
  Navigator.pushNamed(context, '/store/');
}
