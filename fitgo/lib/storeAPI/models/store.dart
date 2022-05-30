//The store model. For simplicity, here we are modeling just few fileds.
// link che spiega l'API
//https://rapidapi.com/apidojo/api/asos2/

class Store {
  final int? id;
  final String? name;
  final String? brand_name;
  final String image;
  final double? price;
  final String? size;
  dynamic price_chose;

  Store({
    required this.id,
    required this.name,
    required this.brand_name,
    required this.image,
    required this.price,
    required this.size,
  });

  //This factory method is used to create a new Store object from a JSON.
  factory Store.fromJson(Map<String, dynamic> json) {
    return Store(
      id: json['id'],
      name: json['name'],
      brand_name: json['brand']['name'],
      image: json['media']['images'][0]['url'],
      price: json['price']['current']['value'] * 0.93, //è in euro così
      size: json['sizeGuide'],
    );
  } //Store.fromJson

}//Store