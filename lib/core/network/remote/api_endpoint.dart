class ApiEndpoint {
  static const String baseUrl = 'https://tabbakaapitest.runasp.net/';

  static const String login = '/api/AuthUser/AuthenticateUser';
  static const String register = '/api/AuthUser/RegisterUser';
  static const String searchFoodByName = '/Api/Food/SearchRecipesByName/';
  static const String getIngrediantId =
      'Api/Food/SearchIngredientIdsByName/';

  static const String searchByIngrediantId = 'Api/Food/SearchRecipesByIngredientIds/';
}
