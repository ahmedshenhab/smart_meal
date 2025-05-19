// ignore_for_file: public_member_api_docs, sort_constructors_first
class MealsModel {
  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      imageUrl: json['imageUrl'],
      isFavorite: json['isFavorite'] ?? false,
      recipeId: json['recipeId'],
      recipeName: json['recipe_Name'],
      description: json['description'],
      preparationMethod: json['preparation_Method'],
      time: json['time'],
      calories100g: json['calories_100g'],
      fat100g: json['fat_100g'] ?? 0,
      sugar100g: json['sugar_100g'] ?? 0,
      protein100g: json['protein_100g'],
      carb100: json['carb_100'] ?? 0,
      // ingredientNames: json['ingredientNames'] != null
      // ? List<String>.from(json['ingredientNames'])
      // : null,
      ingredients:
          json['ingredients'] != null
              ? List<Ingredient>.from(
                json['ingredients'].map((x) => Ingredient.fromJson(x)),
              )
              : null,
      type: json['type'],
    );
  }

  MealsModel({
    required this.imageUrl,
    required this.recipeId,
    required this.recipeName,
    required this.description,
    required this.preparationMethod,
    required this.time,
    required this.calories100g,
    required this.fat100g,
    required this.sugar100g,
    required this.protein100g,
    required this.carb100,
    // required this.ingredientNames,
    required this.ingredients,
    required this.type,
    required this.isFavorite,
  });
  final String? imageUrl;
  final int? recipeId;
  final String? recipeName;
  final String? description;
  final String? preparationMethod;
  final num? time;
  final num? calories100g;
  final num? fat100g;
  final num? sugar100g;
  final num? protein100g;
  final num? carb100;
  // final List<String>? ingredientNames;
  final List<Ingredient>? ingredients;
  final String? type;
  final bool isFavorite;

  static List<MealsModel> fromList(List<dynamic> list) {
    return list.map((item) => MealsModel.fromJson(item)).toList();
  }

  MealsModel copyWith({
    int? recipeId,
    String? recipeName,
    String? description,
    String? preparationMethod,
    num? time,
    num? calories100g,
    num? fat100g,
    num? sugar100g,
    num? protein100g,
    num? carb100,
    List<Ingredient>? ingredients,
    String? type,
    bool? isFavorite,
  }) {
    return MealsModel(
      imageUrl: imageUrl ?? imageUrl,
      recipeId: recipeId ?? this.recipeId,
      recipeName: recipeName ?? this.recipeName,
      description: description ?? this.description,
      preparationMethod: preparationMethod ?? this.preparationMethod,
      time: time ?? this.time,
      calories100g: calories100g ?? this.calories100g,
      fat100g: fat100g ?? this.fat100g,
      sugar100g: sugar100g ?? this.sugar100g,
      protein100g: protein100g ?? this.protein100g,
      carb100: carb100 ?? this.carb100,
      ingredients: ingredients ?? this.ingredients,
      type: type ?? this.type,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

class Ingredient {
  Ingredient({required this.ingredientName, required this.amount});

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredientName: json['ingredientName'],
      amount: json['amount'],
    );
  }

  final String ingredientName;
  final num amount;
}
