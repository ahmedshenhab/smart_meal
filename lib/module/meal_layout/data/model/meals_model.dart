class MealsModel {

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      recipeName: json['recipe_Name'] ,
      description: json['description'] ,
      preparationMethod: json['preparation_Method'] ,
      time: json['time'] ,
      calories100g: json['calories_100g'] ,
      fat100g: json['fat_100g'] ?? 0,
      sugar100g: json['sugar_100g'] ?? 0,
      protein100g: json['protein_100g'] ,
      carb100: json['carb_100'] ?? 0,
      ingredientNames: List<String>.from(json['ingredientNames'] ),
      type: json['type'] ,
    );
  }

  MealsModel({
    required this.recipeName,
    required this.description,
    required this.preparationMethod,
    required this.time,
    required this.calories100g,
    required this.fat100g,
    required this.sugar100g,
    required this.protein100g,
    required this.carb100,
    required this.ingredientNames,
    required this.type,
  });
  final String? recipeName;
  final String? description;
  final String? preparationMethod;
  final num? time;
  final num? calories100g;
  final num? fat100g;
  final num? sugar100g;
  final num? protein100g;
  final num? carb100;
  final List<String>? ingredientNames;
  final String? type;

  static List<MealsModel> fromList(List<dynamic> list) {
    return list.map((item) {
      
      return MealsModel.fromJson(item);
    }).toList();
  }
}
