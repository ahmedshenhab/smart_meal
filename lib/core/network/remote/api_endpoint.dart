class ApiEndpoint {
  static const String baseUrl = 'https://tabbakaapitest.runasp.net/';

  static const String login = 'api/AuthUser/AuthenticateUser';
  static const String register = 'api/AuthUser/RegisterUser';
  static const String searchFoodByName = 'api/Food/recipes/search/by-name/';
  static const String getIngrediantId =
      'api/Food/ingredients/search/by-name/';

  static const String searchByIngrediantId = 'api/Food/recipes/search/by-ingredient-ids/';
  static const String getAllMeal = 'api/Food/recipes/preview/';

}
