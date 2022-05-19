import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fitgo/cryptoAPI/models/crypto.dart';
//import 'package:fitgo/storeAPI/models/store.dart';
import 'package:http/http.dart' as http;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class Favorites extends ChangeNotifier {
  List<Crypto> favorites_c = [];
  List<Store> favorites_s = [];
  List<dynamic> favorites = [];

  Future<void> addFavorite_c(Crypto toAdd) async {
    if (_alreadyIn_c(toAdd) == false) {
      favorites_c.add(toAdd);
      notifyListeners();
    }
  }

  Future<void> addFavorite_s(Store toAdd) async {
    if (_alreadyIn_s(toAdd) == false) {
      favorites_s.add(toAdd);
      notifyListeners();
    }
  }

  Future<void> addCart(dynamic toAdd) async {
    if (_alreadyIn(toAdd) == false) {
      favorites.add(toAdd);
      notifyListeners();
    }
  }

  void removeFavorite_c(int id) {
    favorites_c.removeAt(id);
    notifyListeners();
  }

  void removeFavorite_s(int id) {
    favorites_s.removeAt(id);
    notifyListeners();
  }

  void removeFavorite(int id) {
    favorites.removeAt(id);
    notifyListeners();
  }

  bool _alreadyIn_c(Crypto crypto) {
    for (var f in favorites_c) {
      if (f.id == crypto.id) {
        return true;
      }
    }
    return false;
  }

  bool _alreadyIn_s(Store store) {
    for (var f in favorites_s) {
      if (f.id == store.id) {
        return true;
      }
    }
    return false;
  }

  bool _alreadyIn(dynamic i) {
    for (var f in favorites) {
      if (f.id == i.id) {
        return true;
      }
    }
    return false;
  }

  void showOptions_c(context, Crypto id, int index) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 200,
            color: Color.fromARGB(255, 167, 204, 253),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  ElevatedButton.icon(
                      label: Text('Remove from favorites'),
                      icon: Icon(MdiIcons.delete),
                      onPressed: () {
                        favorites_c.removeAt(index);
                        notifyListeners();
                        Navigator.pop(context);
                      }),
                  ElevatedButton.icon(
                      label: const Text('Add to cart'),
                      icon: Icon(MdiIcons.cart),
                      onPressed: () {
                        Provider.of<Favorites>(context, listen: false)
                            .addCart(id);
                        Navigator.pop(context);
                        final snackBar =
                            SnackBar(content: Text(id.name + ' added to cart'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      })
                ])));
      },
    );
  }

  void showOptions_s(context, Store id, int index) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: 200,
            color: Color.fromARGB(255, 167, 204, 253),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                  ElevatedButton.icon(
                      label: Text('Remove from favorites'),
                      icon: Icon(MdiIcons.delete),
                      onPressed: () {
                        favorites_s.removeAt(index);
                        notifyListeners();
                        Navigator.pop(context);
                      }),
                  ElevatedButton.icon(
                      label: const Text('Add to cart'),
                      icon: Icon(MdiIcons.cart),
                      onPressed: () {
                        Provider.of<Favorites>(context, listen: false)
                            .addCart(id);
                        Navigator.pop(context);
                        final snackBar = SnackBar(
                            content: Text(id.name! + ' added to cart'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      })
                ])));
      },
    );
  }
}//Favorites 