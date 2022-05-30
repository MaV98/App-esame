import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
//import 'dart:js';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fitgo/storeAPI/models/store.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:fitgo/storeAPI/screens/favoriteStorepage.dart';
import 'package:fitgo/storeAPI/widgets/formTiles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class StorePage extends StatefulWidget {
  StorePage({Key? key}) : super(key: key);

  static const route = '/store/';
  static const routename = 'ClothingPage';

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  //Form globalkey: this is required to validate the form fields.
  final formKey = GlobalKey<FormState>();

  //Variables that maintain form field value in memory
  TextEditingController _storeController = TextEditingController();
  //Variable that stores the value of the currently selected item
  Store? _selectedStore;
  //This initializes the textbox and the current selected item
  @override
  void initState() {
    _storeController.text = '';
    _selectedStore = null;

    super.initState();
  } // initState

  //Remember that form controllers need to be manually disposed. So, here we need also to override the dispose() method.
  @override
  void dispose() {
    _storeController.dispose();
    super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {
    //This is for debug.
    print('${StorePage.routename} built');

    return Scaffold(
      appBar: AppBar(
        title: Text(StorePage.routename),
        actions: [
          //This action is used to navigate to the Favorite Page.
          IconButton(
              onPressed: () => _toFavoritePage(context),
              icon: Icon(Icons.favorite))
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            //This build the form which is composed of the textbox and the search button
            _buildForm(context),
            //Let's add 30 px of space
            SizedBox(
              height: 30,
            ),
            //A Card is used to dispaly the result of the API call.

            _selectedStore == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Text('Most popular',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 580,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            201928065,
                            201875999,
                            202267612,
                            202138725,
                            201611296
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  //decoration:
                                  //  BoxDecoration(color: Colors.amber),
                                  child: FutureBuilder(
                                    future: _fetchStore_s(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final store = snapshot.data as Store;
                                        return _buildStoreCard_s(
                                            context, store);
                                      } else {
                                        return SizedBox(
                                          //width: 250,
                                          //height: 270,
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 217, 217, 217),
                                            highlightColor: Colors.white,
                                            child: Card(elevation: 3),
                                          ),
                                        );

                                        //CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Text('Trending',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 580,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            201388445,
                            13997860,
                            201226503,
                            200889911,
                            202359552,
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  //decoration:
                                  //  BoxDecoration(color: Colors.amber),
                                  child: FutureBuilder(
                                    future: _fetchStore_s(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final store = snapshot.data as Store;

                                        return _buildStoreCard_s(
                                            context, store);
                                      } else {
                                        return SizedBox(
                                          width: 250,
                                          height: 270,
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 217, 217, 217),
                                            highlightColor: Colors.white,
                                            child: Card(elevation: 3),
                                          ),
                                        );

                                        //CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Text('Hoodies & Sweatshirts',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 580,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            202782599,
                            201342705,
                            202310457,
                            23047520,
                            201695235,
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  //decoration:
                                  //  BoxDecoration(color: Colors.amber),
                                  child: FutureBuilder(
                                    future: _fetchStore_s(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final store = snapshot.data as Store;

                                        return _buildStoreCard_s(
                                            context, store);
                                      } else {
                                        return SizedBox(
                                          width: 250,
                                          height: 270,
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 217, 217, 217),
                                            highlightColor: Colors.white,
                                            child: Card(elevation: 3),
                                          ),
                                        );

                                        //CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Text('Shoes & Sneakers',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 580,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            202391304,
                            201584432,
                            201820229,
                            202391244,
                            202210972,
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  //decoration:
                                  //  BoxDecoration(color: Colors.amber),
                                  child: FutureBuilder(
                                    future: _fetchStore_s(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final store = snapshot.data as Store;

                                        return _buildStoreCard_s(
                                            context, store);
                                      } else {
                                        return SizedBox(
                                          width: 250,
                                          height: 270,
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 217, 217, 217),
                                            highlightColor: Colors.white,
                                            child: Card(elevation: 3),
                                          ),
                                        );

                                        //CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 45,
                            ),
                            Text('Shorts & pants',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 580,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            201372389,
                            201650757,
                            202366808,
                            201920324,
                            201831601,
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  //decoration:
                                  //  BoxDecoration(color: Colors.amber),
                                  child: FutureBuilder(
                                    future: _fetchStore_s(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final store = snapshot.data as Store;

                                        return _buildStoreCard_s(
                                            context, store);
                                      } else {
                                        return SizedBox(
                                          width: 250,
                                          height: 270,
                                          child: Shimmer.fromColors(
                                            baseColor: Color.fromARGB(
                                                255, 217, 217, 217),
                                            highlightColor: Colors.white,
                                            child: Card(elevation: 3),
                                          ),
                                        );

                                        //CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ])
                : _buildStoreCard(context),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ]),
    );
  } //build

  //This utility method is used to build the Form
  Widget _buildForm(BuildContext context) {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 8, left: 20, right: 20),
            child: FormNumberTile(
                labelText: 'Item id (e.g. 201672661)',
                controller: _storeController,
                icon: IconButton(
                  onPressed: () {
                    _showDescription(context);
                  },
                  icon: Icon(Icons.question_mark_rounded),
                  //icon: Icon(MdiIcons.commentQuestion),
                  color: Colors.blue,
                  iconSize: 40,
                ) //MdiIcons.bitcoin,
                ),
          ),
        ),
        ElevatedButton(
            onPressed: () => _validateAndSearch(context),
            child: Text('Search')),
      ],
    );
  } // _buildForm

  //This utility method is used to build the Card showing the results of the API call
  Widget _buildStoreCard(BuildContext context) {
    return _selectedStore!.id == null
        ? Text('Item not found')
        : Container(
            width: 250,
            height: 580,
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${_selectedStore!.name}'.toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Image.network('https://' + _selectedStore!.image),
                    Text(
                      '#' + '${_selectedStore!.id}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _selectedStore!.size == null
                        ? SizedBox()
                        : RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'size guide',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(_selectedStore!.size!);
                                    })
                            ]),
                          ),
                    Text('Brand: ' +
                        '${_selectedStore!.brand_name}'.toUpperCase()),
                    Text('Price: ' +
                        _selectedStore!.price!.toStringAsFixed(2) +
                        '€'),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          Provider.of<Favorites>(context, listen: false)
                              .addFavorite_s(_selectedStore!),
                      child: Icon(Icons.favorite),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  } //_buildStoreCard

  //This utility method is used to fetch the store data using the rapidAPI of asos
  Future<void> _fetchStore(int id) async {
    String _baseUrl = "https://asos2.p.rapidapi.com/products/v3/detail?id=$id";
    const Map<String, String> _headers = {
      "x-rapidapi-key": "e31897ad6bmsh0107bb7ae9cd6f1p13f2acjsna4db557e4490",
      //"x-rapidapi-key": "fc970a41cfmshadf736207c8cbcfp1e119fjsn94ccf9dac26b",
      "x-rapidapi-host": "asos2.p.rapidapi.com",
    };
    Uri uri = Uri.parse(
      _baseUrl,
    );
    final response = await http.get(uri, headers: _headers);

    setState(() {
      response.statusCode == 200
          ? _selectedStore = Store.fromJson(jsonDecode(response.body))
          : _selectedStore = null;
    });
  } //_fecthStore

  //Utility method that validate the form and, if it is valid, tries to fetch the store data.
  void _validateAndSearch(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await _fetchStore(int.parse(_storeController.text));
    } //if
  } // _validateAndSearch

  //Utility method to navigate to the Favorite item page
  void _toFavoritePage(BuildContext context) {
    Navigator.pushNamed(context, FavoriteStorePage.route);
  } //_toFavoritePage
} //HomePage

Future<void> _showDescription(context) async {
  return showDialog<void>(
    //context: context,
    barrierDismissible: true, // user can not tap the button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Item id'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Search for an item and then add it to the favourite page.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
    context: context,
  );
}

//This utility method is used to fetch the store data using the rapidAPI of asos
Future<Store?> _fetchStore_s(int id) async {
  String _baseUrl = "https://asos2.p.rapidapi.com/products/v3/detail?id=$id";
  const Map<String, String> _headers = {
    "x-rapidapi-key": "e31897ad6bmsh0107bb7ae9cd6f1p13f2acjsna4db557e4490",
    "x-rapidapi-host": "asos2.p.rapidapi.com",
  };
  Uri uri = Uri.parse(
    _baseUrl,
  );
  final response = await http.get(uri, headers: _headers);
  print(response.statusCode);
  return response.statusCode == 200
      ? Store.fromJson(jsonDecode(response.body))
      : null;
} //_fecthStore

//This utility method is used to build the Card showing the results of the API call
Widget _buildStoreCard_s(BuildContext context, store) {
  return Container(
    width: 250,
    height: 270,
    child: Card(
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${store!.name}'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.network('https://' + store!.image),
            Text(
              '#' + '${store!.id}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            store!.size == null
                ? SizedBox()
                : RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'size guide',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              launch(store!.size!);
                            })
                    ]),
                  ),
            Text('Brand: ' + '${store!.brand_name}'.toUpperCase()),
            Text('Price: ' + store!.price.toStringAsFixed(2) + '€'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Provider.of<Favorites>(context, listen: false)
                  .addFavorite_s(store!),
              child: Icon(Icons.favorite),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: CircleBorder(),
                padding: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    ),
  );
} //_buildStoreCard
