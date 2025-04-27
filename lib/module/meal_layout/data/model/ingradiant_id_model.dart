class IngredientIdsModel {
  IngredientIdsModel({required this.ids});

  // Factory method to parse from JSON
  factory IngredientIdsModel.fromJson(List<dynamic> json) {
    return IngredientIdsModel(ids: List<int>.from(json));
  }
  final List<int> ids;

  // To JSON (if you want to send it back to server)
  // List<int> toJson() {
  //   return ids;
  // }

}
