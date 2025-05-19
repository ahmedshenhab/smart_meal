class ApiEndpoint {
  static const String baseUrl = 'https://tabbakaapitest.runasp.net/api/';

  static const String login = 'AuthUser/Login';
  static const String register = 'AuthUser/RegisterUser';
  static const String searchFoodByName = 'Food/recipes/search/by-name/';
  static const String getIngrediantId = 'Food/ingredients/search/by-name/';

  static const String searchByIngrediantId =
      'Food/recipes/search/by-ingredient-ids/';
  static const String getAllMeal = 'Food/recipes/preview/';
  static const String addFavorite = 'Favorites/';
  static const String getAllFavorite = 'Favorites';
  static const String deleteFavoriteId = 'Favorites/';
  static const String generateToken = 'AuthUser/RequestPasswordReset';
  static const String  changePassword = 'AuthUser/ResetUserPassword';
}
