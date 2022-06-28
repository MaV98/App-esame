import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:provider/provider.dart';
import 'package:fitgo/cryptoAPI/widgets/formTiles.dart';

class FavoriteCryptoPage extends StatelessWidget {
  FavoriteCryptoPage({Key? key}) : super(key: key);

  static const route = '/favoritecrypto/';
  static const routename = 'Favorite Crypto';

  TextEditingController _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('${FavoriteCryptoPage.routename} built');

    Map<dynamic, dynamic> stepscount =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    dynamic steps_count = stepscount['count_step'];
    dynamic a = stepscount['a'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 32, 25),
        title: Text(FavoriteCryptoPage.routename),
        actions: [
          //This action is used to navigate to the Favorite Page.
          IconButton(
              onPressed: () => _toCartPage(context, steps_count, a),
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: Consumer<Favorites>(builder: (context, favorites, child) {
          return favorites.favorites_c.isNotEmpty
              ? ListView.builder(
                  itemCount: favorites.favorites_c.length,
                  itemBuilder: (context, index) {
                    final crypto = favorites.favorites_c[index];
                    return Card(
                        elevation: 5,
                        child: Dismissible(
                            key: UniqueKey(),
                            background: Container(
                              color: Colors.green,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  children: [
                                    Icon(MdiIcons.cart, color: Colors.white),
                                    Text('Add to Cart',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            secondaryBackground: Container(
                              color: Colors.red,
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('Remove from favourites',
                                        style: TextStyle(color: Colors.white)),
                                    Icon(MdiIcons.delete, color: Colors.white),
                                  ],
                                ),
                              ),
                            ),
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                print(favorites.alreadyIn(crypto));
                                if (favorites.alreadyIn(crypto)) {
                                  return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: const Text(
                                                "Item already in the cart"),
                                            content: const Text(
                                                'If you want to modify this item please go to the cart, hold down the item and edit the order. Otherwise remove the item from the cart and reprocess with the order'),
                                            actions: [
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                  Color.fromARGB(
                                                      255, 30, 32, 25),
                                                )),
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: const Text('Ok'),
                                              ),
                                            ]);
                                      });
                                } else {
                                  return await showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            title: const Text(
                                                'Choose the quantity'),
                                            content: ListView(
                                              children: [
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      FormNumberTile(
                                                        labelText:
                                                            'Item quantity',
                                                        icon: Icons
                                                            .graphic_eq_sharp,
                                                        controller: _Controller,
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                      ),
                                                      Text(
                                                        'Price: ${crypto.price}€',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                      ),
                                                      Image.network(
                                                          crypto.image)
                                                    ]),
                                              ],
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                    Color.fromARGB(
                                                        255, 30, 32, 25),
                                                  )),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(true);
                                                  },
                                                  child: const Text("Confirm")),
                                              ElevatedButton(
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all(
                                                  Color.fromARGB(
                                                      255, 30, 32, 25),
                                                )),
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: const Text('Undo'),
                                              ),
                                            ]);
                                      });
                                }
                              } else {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Removal Confirmation"),
                                      content: const Text(
                                          'Are you sure you want to remove this item from favourites?'),
                                      actions: [
                                        ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                              Color.fromARGB(255, 30, 32, 25),
                                            )),
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text("Yes")),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                            Color.fromARGB(255, 30, 32, 25),
                                          )),
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text("No"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: ListTile(
                              leading: Image.network(crypto.image),
                              subtitle: Text('Price: ${crypto.price}€'),
                              trailing: Icon(
                                MdiIcons.arrowLeftRightBold,
                                color: Color.fromARGB(255, 30, 32, 25),
                              ),
                              title: Text(crypto.name.toUpperCase()),
                            ),
                            onDismissed: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                crypto.price_chose = crypto.price *
                                    double.parse(_Controller.text);

                                Provider.of<Favorites>(context, listen: false)
                                    .addCart(crypto);

                                final snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content:
                                        Text(crypto.name + ' added to cart'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                favorites.removeFavorite_c(index);
                              }
                            }));
                  })
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'You have not element saved in favourites. To add your favourite items visit the store and then click the heart button',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Lottie.asset('assets/71390-shopping-cart-loader.json'),
                  // Icon(
                  //   MdiIcons.fileRemoveOutline,
                  //   size: 100,
                  // )
                ]);
        }),
      ),
    );
  } //build

}

void _toCartPage(BuildContext context, count_step, a) {
  Navigator.pushNamed(context, '/cart/',
      arguments: {'count_step': count_step, 'a': a});
}
