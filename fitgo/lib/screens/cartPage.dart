import 'package:fitgo/cryptoAPI/models/crypto.dart';
import 'package:fitgo/cryptoAPI/screens/favoriteCryptopage.dart';
import 'package:fitgo/screens/successPage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:provider/provider.dart';
import 'package:fitgo/cryptoAPI/widgets/formTiles.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:page_transition/page_transition.dart';

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  static const route = '/cart/';
  static const routename = 'Cart Page';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  TextEditingController _Controller = TextEditingController();

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    print('${CartPage.routename} built');

    Map<dynamic, dynamic> stepscount =
        ModalRoute.of(context)!.settings.arguments! as Map<String, dynamic>;
    dynamic steps_count = stepscount['count_step'];
    dynamic a = stepscount['a'];

    return Scaffold(
        appBar: AppBar(
          title: Text('Your cart'),
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
                    price_list.add(i.price_chose);
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
                                            trailing: Text(i.price_chose
                                                    .toStringAsFixed(3) +
                                                '€'),
                                            title: Text(i.name.toUpperCase()),
                                            subtitle: Text(
                                                'Quantity: ${(i.price_chose / i.price).toStringAsFixed(4)}'),
                                            onLongPress: () =>
                                                modFun(context, _Controller, i),
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
                                            trailing: Text(i.price_chose
                                                    .toStringAsFixed(3) +
                                                '€'),
                                            title: Text(i.name.toUpperCase()),
                                            subtitle: Text(
                                                'Quantity: ${(i.price_chose / i.price).toStringAsFixed(4)}'),
                                            onLongPress: () =>
                                                modFun(context, _Controller, i),
                                          ),
                                          onDismissed: (direction) async {
                                            favorites.removeFavorite(index);
                                          })),
                              SizedBox(
                                height: 30,
                              ),
                              Text('Total Price: ${sum.toStringAsFixed(3)}€',
                                  style: TextStyle(fontSize: 15)),
                              steps_count == -1
                                  ? Text(
                                      'Authorization not granted, no discount applicable',
                                      style: TextStyle(fontSize: 15))
                                  : Text(
                                      'Accumulated discount: ${5 * steps_count.toInt()}€',
                                      style: TextStyle(fontSize: 15)),
                              steps_count == -1
                                  ? Text(
                                      'Final price: ${(sum).toStringAsFixed(3)}€',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22))
                                  : sum - 5 * steps_count.toInt() >= 0
                                      ? Text(
                                          'Final price: ${(sum - 5 * steps_count.toInt()).toStringAsFixed(3)}€',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22))
                                      : Text('Final price: 0.0€',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22)),
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SwipeableButtonView(
                                    buttonText: 'SLIDE TO PAYMENT',
                                    buttonWidget: Container(
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        //MdiIcons.arrowRightThick,
                                        color: Colors.grey,
                                        size: 50,
                                      ),
                                    ),
                                    activeColor: Colors.green,
                                    isFinished: isFinished,
                                    onWaitingProcess: () {
                                      Future.delayed(Duration(seconds: 3), () {
                                        setState(() {
                                          isFinished = true;
                                        });
                                      });
                                    },
                                    onFinish: () {
                                      Navigator.pushReplacementNamed(
                                          context, SuccessPage.route,
                                          arguments: {'a': a});
                                    }
                                    //     () async {
                                    //   await Navigator.push(
                                    //       context,
                                    //       PageTransition(
                                    //           type: PageTransitionType.fade,
                                    //           child: SuccessPage()));
                                    //   setState(() {
                                    //     isFinished = false;
                                    //   });
                                    // },
                                    ),
                              )
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
                                          i.price_chose.toStringAsFixed(3) +
                                              '€'),
                                      title: Text(i.name.toUpperCase()),
                                      subtitle: Text(
                                          'Quantity: ${(i.price_chose / i.price).toStringAsFixed(4)}'),
                                      onLongPress: () =>
                                          modFun(context, _Controller, i),
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
                                          i.price_chose.toStringAsFixed(3) +
                                              '€'),
                                      title: Text(i.name.toUpperCase()),
                                      subtitle: Text(
                                          'Quantity: ${(i.price_chose / i.price).toStringAsFixed(4)}'),
                                      onLongPress: () =>
                                          modFun(context, _Controller, i),
                                    ),
                                    onDismissed: (direction) async {
                                      favorites.removeFavorite(index);
                                    }));
                  },
                )
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Your cart is empty. If you want to add items to cart visit the store, add what you like to favorites and then add to cart.',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Lottie.asset('assets/71390-shopping-cart-loader.json'),
                  // Icon(
                  //   MdiIcons.fileRemoveOutline,
                  //   size: 100,
                  // )
                ]);
        })));
  }

  //void setState(Null Function() param0) {}
  void modFun(context, Controller, i) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Modify the quantity.'),
              content: ListView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FormNumberTile(
                      labelText: 'New quantity',
                      icon: Icons.graphic_eq_sharp,
                      controller: Controller,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    i is Crypto
                        ? Text(
                            'The change refers to the initial ${i.name} price ${i.price}€.',
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            'The change refers to the initial ${i.name} price ${i.price!.toStringAsFixed(3)}€.',
                            textAlign: TextAlign.center,
                          ),
                    SizedBox(
                      height: 50,
                    ),
                    i is Crypto
                        ? Image.network(i.image)
                        : Image.network('https://' + i.image),
                  ],
                ),
              ]),
              actions: [
                ElevatedButton(
                    onPressed: (() {
                      i.price_chose = i.price * double.parse(Controller.text);
                      setState(() {});
                      Navigator.of(context).pop(true);
                    }),
                    child: const Text("Confirm")),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Undo'),
                ),
              ]);
        });
  }
}
