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
                        child: ListTile(
                          leading: Image.network('https://' + store.image),
                          trailing: Icon(MdiIcons.arrowLeftRightBold),
                          title: Text(store.name!.toUpperCase()),
                          //onTap: () => favorites.showOptions_s(context, store,
                          //    index) //favorites.removeFavorite_s(index),
                        ),
                        onDismissed: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            Provider.of<Favorites>(context, listen: false)
                                .addCart(store);
                            final snackBar = SnackBar(
                                content: Text(store.name! + ' added to cart'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          } else {
                            favorites.removeFavorite_s(index);
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
