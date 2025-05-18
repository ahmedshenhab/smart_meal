import 'package:smart_meal/generated/l10n.dart';

class AvoidanceModel {

  AvoidanceModel({
    required this.key,
    required this.items,
  });
  final String key;
  final List<String> items;


   static  final diseaseAvoidanceList = [
    AvoidanceModel(
      key: "Diabetes",
      items: ["Sugar", "Honey", "Pastries", "Sweets", "Soft Drinks", "Dates"],
    ),
    AvoidanceModel(
      key: "HighBloodPressure",
      items: ["Salt", "Pickles", "Processed Meat", "Salty Cheese"],
    ),
    AvoidanceModel(
      key: "HighCholesterol",
      items: ["Egg Yolks", "Saturated Fats", "Butter", "Liver"],
    ),
    AvoidanceModel(
      key: "Gout",
      items: ["Red Meat", "Liver", "Lentils", "Beans", "Shrimp"],
    ),
    AvoidanceModel(
      key: "AnemiaG6PD",
      items: ["Fava Beans", "Lentils", "Chickpeas"],
    ),
  ];
    static  final allergyAvoidanceList = [
    AvoidanceModel(
      key: "Nuts",
      items: ["Peanuts", "Walnuts", "Cashews", "Almonds", "Hazelnuts"],
    ),
    AvoidanceModel(
      key: "Dairy",
      items: ["Milk", "Cheese", "Butter", "Cream", "Yogurt"],
    ),
    AvoidanceModel(
      key: "Gluten",
      items: ["Wheat Flour", "Bread", "Pasta", "Cake", "Cereal with barley"],
    ),
    AvoidanceModel(key: "Eggs", items: ["Eggs", "Mayonnaise", "Whipped Cream"]),
    AvoidanceModel(
      key: "Seafood",
      items: ["Shrimp", "Fish", "Tuna", "Sardines", "Crab"],
    ),
    AvoidanceModel(key: "Soy", items: ["Soy Sauce", "Soy Milk", "Soybeans"]),
    AvoidanceModel(key: "Sesame", items: ["Sesame", "Tahini"]),
  ];

static   String getAvoidanceNameByKey(String key, S localizations) {
  switch (key) {
    case "Diabetes":
      return localizations.Diabetes; // your localized string for Diabetes
    case "HighBloodPressure":
      return localizations.HighBloodPressure;
    case "HighCholesterol":
      return localizations.HighCholesterol;
    case "Gout":
      return localizations.Gout;
    case "AnemiaG6PD":
      return localizations.AnemiaG6PD;

    case "Nuts":
      return localizations.Nuts;
    case "Dairy":
      return localizations.Dairy;
    case "Gluten":
      return localizations.Gluten;
    case "Eggs":
      return localizations.Eggs;
    case "Seafood":
      return localizations.Seafood;
    case "Soy":
      return localizations.Soy;
    case "Sesame":
      return localizations.Sesame;

    default:
      return key; // fallback to key if no localization found
  }
}
}

