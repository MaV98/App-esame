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
          List<dynamic> price_list = [];
          return favorites.favorites.isNotEmpty
              ? ListView.builder(
                  itemCount: favorites.favorites.length,
                  itemBuilder: (context, index) {
                    dynamic i = favorites.favorites[index];
                    double sum = 0;
                    price_list.add(i.price);
                    price_list.forEach((e) => sum += e);
                    return index == favorites.favorites.length - 1
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                  elevation: 5,
                                  child: i is Crypto
                                      ? Dismissible(
                                          key: UniqueKey(),
                                          background: Container(
                                            color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                children: [
                                                  Icon(MdiIcons.delete,
                                                      color: Colors.white),
                                                  Text('Remove from Cart',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          secondaryBackground: Container(
                                            color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('Remove from Cart',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  Icon(MdiIcons.delete,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ),
                                          ),
                                          confirmDismiss: (DismissDirection
                                              direction) async {
                                            return await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Removal Confirmation'),
                                                  content: const Text(
                                                      'Are you sure you want to remove this item from the cart?'),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true),
                                                        child:
                                                            const Text('Yes')),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text('No'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: ListTile(
                                            leading: Image.network(i.image),
                                            trailing: Text(
                                                i.price.toStringAsFixed(3) +
                                                    '€'),
                                            title: Text(i.name.toUpperCase()),
                                          ),
                                          onDismissed: (direction) async {
                                            favorites.removeFavorite(index);
                                          })
                                      : Dismissible(
                                          key: UniqueKey(),
                                          background: Container(
                                            color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                children: [
                                                  Icon(MdiIcons.delete,
                                                      color: Colors.white),
                                                  Text('Remove from Cart',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ),
                                          secondaryBackground: Container(
                                            color: Colors.red,
                                            child: Padding(
                                              padding: const EdgeInsets.all(15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text('Remove from Cart',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                  Icon(MdiIcons.delete,
                                                      color: Colors.white),
                                                ],
                                              ),
                                            ),
                                          ),
                                          confirmDismiss: (DismissDirection
                                              direction) async {
                                            return await showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Removal Confirmation'),
                                                  content: const Text(
                                                      'Are you sure you want to remove this item from the cart?'),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () =>
                                                            Navigator.of(
                                                                    context)
                                                                .pop(true),
                                                        child:
                                                            const Text('Yes')),
                                                    ElevatedButton(
                                                      onPressed: () =>
                                                          Navigator.of(context)
                                                              .pop(false),
                                                      child: const Text('No'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: ListTile(
                                            leading: Image.network(
                                                'https://' + i.image),
                                            trailing: Text(
                                                i.price.toStringAsFixed(3) +
                                                    '€'),
                                            title: Text(i.name.toUpperCase()),
                                          ),
                                          onDismissed: (direction) async {
                                            favorites.removeFavorite(index);
                                          })),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Total Price: ${sum.toStringAsFixed(3)}€',
                                  style: TextStyle(fontSize: 15)),
                              Text('Accumulated discount: 10€',
                                  style: TextStyle(fontSize: 15)),
                              Text(
                                  'Final price: ${(sum - 10).toStringAsFixed(3)}€',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22))
                            ],
                          )
                        : Card(
                            elevation: 5,
                            child: i is Crypto
                                ? Dismissible(
                                    key: UniqueKey(),
                                    background: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(MdiIcons.delete,
                                                color: Colors.white),
                                            Text('Remove from Cart',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    secondaryBackground: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('Remove from Cart',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Icon(MdiIcons.delete,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Removal Confirmation'),
                                            content: const Text(
                                                'Are you sure you want to remove this item from the cart?'),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(true),
                                                  child: const Text('Yes')),
                                              ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: const Text('No'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: ListTile(
                                      leading: Image.network(i.image),
                                      trailing: Text(
                                          i.price.toStringAsFixed(3) + '€'),
                                      title: Text(i.name.toUpperCase()),
                                    ),
                                    onDismissed: (direction) async {
                                      favorites.removeFavorite(index);
                                    })
                                : Dismissible(
                                    key: UniqueKey(),
                                    background: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          children: [
                                            Icon(MdiIcons.delete,
                                                color: Colors.white),
                                            Text('Remove from Cart',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    secondaryBackground: Container(
                                      color: Colors.red,
                                      child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('Remove from Cart',
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            Icon(MdiIcons.delete,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ),
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                                'Removal Confirmation'),
                                            content: const Text(
                                                'Are you sure you want to remove this item from the cart?'),
                                            actions: [
                                              ElevatedButton(
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(true),
                                                  child: const Text('Yes')),
                                              ElevatedButton(
                                                onPressed: () =>
                                                    Navigator.of(context)
                                                        .pop(false),
                                                child: const Text('No'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: ListTile(
                                      leading:
                                          Image.network('https://' + i.image),
                                      trailing: Text(
                                          i.price.toStringAsFixed(3) + '€'),
                                      title: Text(i.name.toUpperCase()),
                                    ),
                                    onDismissed: (direction) async {
                                      favorites.removeFavorite(index);
                                    }));
                  },
                )
              : Container(
                  child: Text(
                    'Your cart is empty. If you want to add items to cart visit the store, add what you like to favorites and then add to cart.',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                );
        })));
  }
} //build


