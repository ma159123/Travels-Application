class DataModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  int? people;
  String? img;
  String? location;

  DataModel({
    this.name,
    this.description,
    this.price,
    this.stars,
    this.people,
    this.img,
    this.location,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        description: json['description'],
        price: json['price'],
        stars: json['stars'],
        people: json['people'],
        img: json['img'],
        location: json['location']);
  }
}
