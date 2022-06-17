import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:fitgo/cryptoAPI/widgets/formTiles.dart';

class FavoriteStorePage extends StatelessWidget {
  FavoriteStorePage({Key? key}) : super(key: key);

  static const route = '/favoritestore/';
  static const routename = 'Favorite Items';

  TextEditingController _Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('${FavoriteStorePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(FavoriteStorePage.routename),
      ),
      body: Center(
        child: Consumer<Favorites>(builder: (context, favorites, child) {
          return favorites.favorites_s.isNotEmpty
              ? ListView.builder(
                  itemCount: favorites.favorites_s.length,
                  itemBuilder: (context, index) {
                    final store = favorites.favorites_s[index];
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
                                print(favorites.alreadyIn(store));
                                if (favorites.alreadyIn(store)) {
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
                                                        'Price: ${store.price!.toStringAsFixed(3)}€',
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 40,
                                                      ),
                                                      Image.network('https://' +
                                                          store.image)
                                                    ]),
                                              ],
                                            ),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pop(true);
                                                  },
                                                  child: const Text("Confirm")),
                                              ElevatedButton(
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
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text("Yes")),
                                        ElevatedButton(
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
                              leading: Image.network('https://' + store.image),
                              subtitle: Text(
                                  'Price: ${store.price!.toStringAsFixed(3)}€'),
                              trailing: Icon(MdiIcons.arrowLeftRightBold),
                              title: Text(store.name!.toUpperCase()),
                            ),
                            onDismissed: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                store.price_chose = store.price! *
                                    double.parse(_Controller.text);
                                Provider.of<Favorites>(context, listen: false)
                                    .addCart(store);
                                final snackBar = SnackBar(
                                    backgroundColor: Colors.green,
                                    content:
                                        Text(store.name! + ' added to cart'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                favorites.removeFavorite_s(index);
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
