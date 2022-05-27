import 'package:flutter/material.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(FavoriteCryptoPage.routename),
      ),
      body: Center(
        child: Consumer<Favorites>(builder: (context, favorites, child) {
          return ListView.builder(
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
                            return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text('Choose the quantity'),
                                      content: FormNumberTile(
                                        labelText: 'Item quantity',
                                        icon: Icons.graphic_eq_sharp,
                                        controller: _Controller,
                                      ),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text("Confirm")),
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text('Undo'),
                                        ),
                                      ]);
                                });
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
                          leading: Image.network(crypto.image),
                          trailing: Icon(MdiIcons.arrowLeftRightBold),
                          title: Text(crypto.name.toUpperCase()),
                          //onTap: () => favorites.showOptions_c(context, crypto,
                          //  index) //favorites.removeFavorite_c(index),
                        ),
                        onDismissed: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            crypto.price =
                                crypto.price * double.parse(_Controller.text);

                            Provider.of<Favorites>(context, listen: false)
                                .addCart(crypto);
                            final snackBar = SnackBar(
                                content: Text(crypto.name + ' added to cart'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            favorites.removeFavorite_c(index);
                          }
                          //favorites_c.removeAt(index);
                          //notifyListeners();
                        }));
              });
        }),
      ),
    );
  } //build

}
