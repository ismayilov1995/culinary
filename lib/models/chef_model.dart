import 'package:culinary_app/services/base/bases.dart';

class Chef {
  final _imageUrlRoot = BaseUrl.restUrl + 'images/user/';

  Chef({
    this.id,
    this.about,
    this.createdAt,
    this.email,
    this.image,
    this.name,
    this.phone,
    this.place,
    this.title,
    this.verified,
  });

  String id;
  String about;
  DateTime createdAt;
  String email;
  String image;
  String name;
  String phone;
  String place;
  String title;
  bool verified;

  String get avatar => _imageUrlRoot + image;

  factory Chef.fromMap(Map<String, dynamic> json) => Chef(
        id: json["_id"],
        about: json["about"],
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
        image: json["image"],
        name: json["name"],
        phone: json["phone"],
        place: json["place"],
        title: json["title"],
        verified: json["verified"],
      );

  factory Chef.fromMapForHome(Map<String, dynamic> json) => Chef(
        name: json["name"],
      );

  Map<String, dynamic> toMapForHome() => {
        "name": name,
      };

  Map<String, dynamic> toMap() => {
        "_id": id,
        "about": about,
        "createdAt": createdAt.toIso8601String(),
        "email": email,
        "image": image,
        "name": name,
        "phone": phone,
        "place": place,
        "title": title,
        "verified": verified,
      };
}
