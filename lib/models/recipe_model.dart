import 'dart:convert';

import 'models.dart';

class RecipeResponse {
  static RecipeResponse recipeResponseFromMap(String str) =>
      RecipeResponse.fromMap(json.decode(str));

  static String recipeResponseToMap(RecipeResponse data) =>
      json.encode(data.toMap());

  RecipeResponse({
    this.recipes,
    this.total,
  });

  List<Recipe> recipes;
  int total;

  factory RecipeResponse.fromMap(Map<String, dynamic> json) => RecipeResponse(
        recipes: List<Recipe>.from(
            json["recipes"].map((e) => Recipe.fromMapForHome(e))),
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "recipes": List<dynamic>.from(recipes.map((e) => e.toMapForHome())),
        "total": total,
      };
}

class Recipe {
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
  });

  String id;
  Chef chef;
  int cookingTime;
  DateTime createdAt;
  String direction;
  List<String> image;
  dynamic ingredients;
  String overview;
  int person;
  String slug;
  String title;

  factory Recipe.fromMap(Map<String, dynamic> json) => Recipe(
        id: json["_id"],
        chef: Chef.fromMap(json["chef"]),
        cookingTime: json["cookingTime"],
        createdAt: DateTime.parse(json["createdAt"]),
        direction: json["direction"],
        image: List<String>.from(json["image"].map((x) => x)),
        ingredients: json["ingredients"],
        overview: json["overview"],
        person: json["person"],
        slug: json["slug"],
        title: json["title"],
      );

  factory Recipe.fromMapForHome(Map<String, dynamic> json) => Recipe(
        id: json["_id"],
        chef: Chef.fromMapForHome(json["chef"]),
        cookingTime: json["cookingTime"],
        image: List<String>.from(json["image"].map((x) => x)),
        overview: json["overview"],
        person: json["person"],
        slug: json["slug"],
        title: json["title"],
      );

  Map<String, dynamic> toMapForHome() => {
        "_id": id,
        "chef": chef.toMapForHome(),
        "cookingTime": cookingTime,
        "image": List<dynamic>.from(image.map((x) => x)),
        "overview": overview,
        "person": person,
        "slug": slug,
        "title": title,
      };

  Map<String, dynamic> toMap() => {
        "_id": id,
        "chef": chef.toMap(),
        "cookingTime": cookingTime,
        "createdAt": createdAt.toIso8601String(),
        "direction": direction,
        "image": List<dynamic>.from(image.map((x) => x)),
        "ingredients": ingredients,
        "overview": overview,
        "person": person,
        "slug": slug,
        "title": title,
      };
}
