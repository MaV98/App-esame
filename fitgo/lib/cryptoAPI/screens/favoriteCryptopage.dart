import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:provider/provider.dart';

class FavoriteCryptoPage extends StatelessWidget {
  FavoriteCryptoPage({Key? key}) : super(key: key);

  static const route = '/favoritecrypto/';
  static const routename = 'Favorite Crypto';

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
                  child: ListTile(
                      leading: Image.network(crypto.image),
                      trailing: Icon(MdiIcons.arrowRightBold),
                      title: Text(crypto.name.toUpperCase()),
                      onTap: () => favorites.showOptions_c(context, crypto,
                          index) //favorites.removeFavorite_c(index),
                      ),
                );
              });
        }),
      ),
    );
  } //build

}
