import 'package:flutter/material.dart';

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
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.white,
                  ),
                ],
              ),
              child: Text(
                  "In total you have covered 100 km this week. So you have 10 tokens that you can use to buy what you want! Explore our store!",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                18,
                0,
                18,
                18,
              ),
              child: SizedBox(
                  height: 200,
                  //This action is used to navigate to the Crypto Page
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
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
                        Image.asset(
                          'assets/crypto_graph_t.png',
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                18,
                0,
                18,
                18,
              ),
              child: SizedBox(
                  height: 200,
                  //This action is used to navigate to the Store Page
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                    ),
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
                        Image.asset(
                          'assets/tshirt.png',
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}

void _tocryptogPage(BuildContext context) {}

void _toCartPage(BuildContext context) {}

void _tostorePage(BuildContext context) {}
