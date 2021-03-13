import 'dart:convert';
import 'dart:io';

import 'package:culinary_app/data/base/rest_url.dart';

import 'models.dart';

class RecipeResponse {
  static RecipeResponse jsonToMap(String str) =>
      RecipeResponse.fromMap(json.decode(str));

  static RecipeResponse jsonToMapFromFavorite(String str) {
    return RecipeResponse.fromMap(json.decode(str)["favorite"]);
  }

  static String mapToJson(RecipeResponse data) => json.encode(data.toMap());

  RecipeResponse({
    this.recipes,
    this.total,
  });

  List<Recipe>? recipes;
  int? total;

  factory RecipeResponse.fromMap(Map<String, dynamic> map) => RecipeResponse(
        recipes: List<Recipe>.from(
            map["recipes"].map((e) => Recipe.fromMapForHome(e))),
        total: map["total"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "recipes": List<dynamic>.from(recipes!.map((e) => e.toMapForHome())),
        "total": total,
      };
}

class Recipe {
  static Recipe fromJSON(String str) =>
      Recipe.fromMap(json.decode(str)['recipe']);

  final _imageUrlRoot = BaseUrl.restUrl + 'images/recipe/';

  Recipe({
    this.id,
    this.chef,
    this.cookingTime,
    this.createdAt,
    this.direction,
    this.image,
    this.ingredients,
    this.overview,
    this.person,
    this.slug,
    this.title,
    this.imageCreate,
  });

  String? id;
  Chef? chef;
  int? cookingTime;
  DateTime? createdAt;
  List<String>? direction;
  List<String>? image;
  List<String>? ingredients;
  String? overview;
  int? person;
  String? slug;
  String? title;
  List<File>? imageCreate;

  String get mainImage => _imageUrlRoot + image!.first;

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        id: json["_id"],
        chef: Chef.fromMap(json["chef"]),
        cookingTime: json["cookingTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        direction: List<String>.from(json["direction"].map((x) => x)),
        image: List<String>.from(json["image"].map((x) => x)),
        ingredients: json["ingredients"] != null
            ? List<String>.from(json["ingredients"].map((x) => x))
            : [],
        overview: json["overview"],
        person: json["person"],
        slug: json["slug"],
        title: json["title"],
      );

  factory Recipe.fromMapForHome(Map<String, dynamic> json) => Recipe(
        id: json["_id"],
        chef: json["chef"] != null ? Chef.fromMapForHome(json["chef"]) : Chef(),
        cookingTime: json["cookingTime"],
        image: List<String>.from(json["image"].map((x) => x)),
        overview: json["overview"],
        person: json["person"],
        slug: json["slug"],
        title: json["title"],
      );

  Map<String, dynamic> toMapForHome() => {
        "_id": id,
        "chef": chef!.toMapForHome(),
        "cookingTime": cookingTime,
        "image": List<dynamic>.from(image!.map((x) => x)),
        "overview": overview,
        "person": person,
        "slug": slug,
        "title": title,
      };

  Map<String, dynamic> toMap() => {
        "_id": id,
        "chef": chef!.toMap(),
        "cookingTime": cookingTime,
        "createdAt": createdAt!.toIso8601String(),
        "direction": List<dynamic>.from(direction!.map((x) => x)),
        "image": List<dynamic>.from(image!.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "overview": overview,
        "person": person,
        "slug": slug,
        "title": title,
      };

  Map<String, dynamic> toMapForCreate() => {
        "cookingTime": cookingTime,
        "direction": List<dynamic>.from(direction!.map((x) => x)),
        "ingredients": List<dynamic>.from(ingredients!.map((x) => x)),
        "overview": overview,
        "person": person,
        "title": title,
      };
}
