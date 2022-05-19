import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:fitgo/cryptoAPI/models/crypto.dart';
import 'package:fitgo/repository/favorites.dart';
import 'package:fitgo/cryptoAPI/screens/favoriteCryptopage.dart';
import 'package:fitgo/cryptoAPI/widgets/formTiles.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';

class CryptoPage extends StatefulWidget {
  CryptoPage({Key? key}) : super(key: key);

  static const route = '/crypto/';
  static const routename = 'CryptoPage';

  @override
  State<CryptoPage> createState() => _CryptoPageState();
}

class _CryptoPageState extends State<CryptoPage> {
  //Form globalkey: this is required to validate the form fields.
  final formKey = GlobalKey<FormState>();

  //Variables that maintain form field value in memory
  TextEditingController _cryptoController = TextEditingController();
  //Variable that stores the value of the currently selected crypto
  Crypto? _selectedCrypto;
  //This initializes the textbox and the current selected crypto
  @override
  void initState() {
    _cryptoController.text = '';
    _selectedCrypto = null;

    super.initState();
  } // initState

  //Remember that form controllers need to be manually disposed. So, here we need also to override the dispose() method.
  @override
  void dispose() {
    _cryptoController.dispose();
    super.dispose();
  } // dispose

  @override
  Widget build(BuildContext context) {
    //This is for debug.
    print('${CryptoPage.routename} built');

    return Scaffold(
      appBar: AppBar(
        title: Text(CryptoPage.routename),
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
            //Add 30 px of space
            SizedBox(
              height: 30,
            ),
            //A Card is used to dispaly the result of the API call.

            _selectedCrypto == null
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
                            height: 280,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            'bitcoin',
                            'ethereum',
                            'binancecoin',
                            'cardano',
                            'solana'
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: FutureBuilder(
                                    future: _fetchCrypto_c(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final crypto = snapshot.data as Crypto;
                                        return _buildCryptoCard_c(
                                            context, crypto);
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
                            height: 280,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            'polkadot',
                            'avalanche-2',
                            'tron',
                            'shiba-inu',
                            'litecoin',
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: FutureBuilder(
                                    future: _fetchCrypto_c(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final crypto = snapshot.data as Crypto;

                                        return _buildCryptoCard_c(
                                            context, crypto);
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
                            Text('DeFi',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 280,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            'uniswap',
                            'tezos',
                            'chainlink',
                            'pancakeswap-token',
                            'fantom',
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: FutureBuilder(
                                    future: _fetchCrypto_c(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final crypto = snapshot.data as Crypto;

                                        return _buildCryptoCard_c(
                                            context, crypto);
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
                            Text('Metaverse',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        CarouselSlider(
                          options: CarouselOptions(
                            height: 280,
                            enableInfiniteScroll: false,
                            //autoPlay: false,
                          ),
                          items: [
                            'apecoin',
                            'decentraland',
                            'the-sandbox',
                            'theta-token',
                            'axie-infinity',
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: FutureBuilder(
                                    future: _fetchCrypto_c(i),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        final crypto = snapshot.data as Crypto;

                                        return _buildCryptoCard_c(
                                            context, crypto);
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
                : _buildCryptoCard(context),
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
            child: FormTextTile(
                labelText: 'Crypto id (e.g. tether)',
                controller: _cryptoController,
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
  Widget _buildCryptoCard(BuildContext context) {
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
                '${_selectedCrypto!.name}'.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.network(_selectedCrypto!.image),
              Text(
                '#' + '${_selectedCrypto!.id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Symbol: ' + '${_selectedCrypto!.simbol}'.toUpperCase()),
              Text('Market cap rank: ' +
                  '${_selectedCrypto!.market_cap_rank}'.toUpperCase()),
              Text('Price: ' + '${_selectedCrypto!.price}'.toUpperCase() + '€'),
              Text('Price change in 24h: ' +
                  '${_selectedCrypto!.price_24h}'.toUpperCase() +
                  '%'),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () => Provider.of<Favorites>(context, listen: false)
                    .addFavorite_c(_selectedCrypto!),
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
  } //_buildCryptoCard

  //This utility method is used to fetch the crypto data using the coingeckoAPI
  Future<void> _fetchCrypto(String id) async {
    String baseURL = 'https://api.coingecko.com/api/v3/';
    String endpoint = 'coins/$id/';
    final url = baseURL + endpoint;
    final response = await http.get(Uri.parse(url));
    setState(() {
      response.statusCode == 200
          ? _selectedCrypto = Crypto.fromJson(jsonDecode(response.body))
          : _selectedCrypto = null;
    });
  } //_fecthCrypto

  //Utility method that validate the form and, if it is valid, tries to fetch the crypto data.
  void _validateAndSearch(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await _fetchCrypto(_cryptoController.text);
    } //if
  } // _validateAndSearch

  //Utility method to navigate to the Favorite crypto page
  void _toFavoritePage(BuildContext context) {
    Navigator.pushNamed(context, FavoriteCryptoPage.route);
  } //_toFavoritePage
} //HomePage

Future<void> _showDescription(context) async {
  return showDialog<void>(
    //context: context,
    barrierDismissible: true, // user can not tap the button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Crypto id'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text:
                        'Search for a crypto and then add it to the favourite page. You can find the crypto id looking at the first column of the ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                      text: 'crypto id database',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                              'https://docs.google.com/spreadsheets/d/1wTTuxXt8n9q7C4NDXqQpI3wpKu1_5bGVmP9Xz0XGSyU/edit#gid=0');
                        })
                ]),
              ),
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

//This utility method is used to fetch the crypto data using the coingeckoAPI
Future<Crypto?> _fetchCrypto_c(String id) async {
  String baseURL = 'https://api.coingecko.com/api/v3/';
  String endpoint = 'coins/$id/';
  final url = baseURL + endpoint;
  final response = await http.get(Uri.parse(url));

  return response.statusCode == 200
      ? Crypto.fromJson(jsonDecode(response.body))
      : null;
}
//_fecthCrypto_c

//This utility method is used to build the Card showing the results of the API call
Widget _buildCryptoCard_c(BuildContext context, crypto) {
  return Container(
    width: 250,
    height: 270,
    child: Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${crypto!.name}'.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.network(crypto!.image),
            Text(
              '#' + '${crypto!.id}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Symbol: ' + '${crypto!.simbol}'.toUpperCase()),
            Text('Market cap rank: ' +
                '${crypto!.market_cap_rank}'.toUpperCase()),
            Text('Price: ' + '${crypto!.price}'.toUpperCase() + '€'),
            Text('Price change in 24h: ' +
                '${crypto!.price_24h}'.toUpperCase() +
                '%'),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => Provider.of<Favorites>(context, listen: false)
                  .addFavorite_c(crypto!),
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
} //_buildCryptoCard_c

