//The crypto model. For simplicity, here we are modeling just few fileds.
// link che spiega l'API
//https://www.coingecko.com/en/api/documentation

class Crypto {
  final String id;
  final String name;
  final String simbol;
  final int market_cap_rank;
  dynamic price;
  final price_24h;
  final String image;

  Crypto({
    required this.id,
    required this.name,
    required this.simbol,
    required this.market_cap_rank,
    required this.price,
    required this.price_24h,
    required this.image,
  });

  //This factory method is used to create a new Crypto object from a JSON.
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      name: json['name'],
      simbol: json['symbol'],
      market_cap_rank: json['market_cap_rank'],
      price: json['market_data']['current_price']['eur'],
      price_24h: json['market_data']['price_change_percentage_24h'],
      image: json['image']['small'],
    );
  } //Crypto.fromJson

}//Crypto