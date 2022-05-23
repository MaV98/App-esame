import 'package:fitgo/cryptoAPI/models/crypto.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  static const route = '/cart/';
  static const routename = 'Cart Page';

  @override
  Widget build(BuildContext context) {
    print('${CartPage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(CartPage.routename),
      ),
      body: Center(
        child: Consumer<Favorites>(builder: (context, favorites, child) {
          return ListView.builder(
              itemCount: favorites.favorites.length,
              itemBuilder: (context, index) {
                final i = favorites.favorites[index];
                return Card(
                    elevation: 5,
                    child: i is Crypto
                        ? ListTile(
                            leading: Image.network(i.image),
                            trailing: Icon(MdiIcons.delete),
                            title: Text(i.name.toUpperCase()),
                            onTap: () {
                              favorites.removeFavorite(index);
                            })
                        : ListTile(
                            leading: Image.network('https://' + i.image),
                            trailing: Icon(MdiIcons.delete),
                            title: Text(i.name.toUpperCase()),
                            onTap: () {
                              favorites.removeFavorite(index);
                            }));
              });
        }),
      ),
    );
  } //build

}
