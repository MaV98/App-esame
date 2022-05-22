import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fitgo/repository/favorites.dart';

class FavoriteStorePage extends StatelessWidget {
  FavoriteStorePage({Key? key}) : super(key: key);

  static const route = '/favoritestore/';
  static const routename = 'Favorite Items';

  @override
  Widget build(BuildContext context) {
    print('${FavoriteStorePage.routename} built');
    return Scaffold(
      appBar: AppBar(
        title: Text(FavoriteStorePage.routename),
      ),
      body: Center(
        child: Consumer<Favorites>(builder: (context, favorites, child) {
          return ListView.builder(
              itemCount: favorites.favorites_s.length,
              itemBuilder: (context, index) {
                final store = favorites.favorites_s[index];
                return Card(
                  elevation: 5,
                  child: ListTile(
                      leading: Image.network('https://' + store.image),
                      trailing: Icon(MdiIcons.arrowRightBold),
                      title: Text(store.name!.toUpperCase()),
                      onTap: () => favorites.showOptions_s(context, store,
                          index) //favorites.removeFavorite_s(index),
                      ),
                );
              });
        }),
      ),
    );
  } //build

} //HomePage