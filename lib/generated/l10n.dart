// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `login with`
  String get loginWithHeader {
    return Intl.message(
      'login with',
      name: 'loginWithHeader',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get LogIn {
    return Intl.message('Log in', name: 'LogIn', desc: '', args: []);
  }

  /// `don't have an account? `
  String get dontHaveAnccount {
    return Intl.message(
      'don\'t have an account? ',
      name: 'dontHaveAnccount',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `ok`
  String get ok {
    return Intl.message('ok', name: 'ok', desc: '', args: []);
  }

  /// `Password`
  String get Password {
    return Intl.message('Password', name: 'Password', desc: '', args: []);
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `at least 6 character`
  String get validationPassword {
    return Intl.message(
      'at least 6 character',
      name: 'validationPassword',
      desc: '',
      args: [],
    );
  }

  /// `'Please enter your email`
  String get validate1tionEmail {
    return Intl.message(
      '\'Please enter your email',
      name: 'validate1tionEmail',
      desc: '',
      args: [],
    );
  }

  /// `'Please enter a valid email'`
  String get validate2tionEmail {
    return Intl.message(
      '\'Please enter a valid email\'',
      name: 'validate2tionEmail',
      desc: '',
      args: [],
    );
  }

  /// `forget password?`
  String get forgetPassword {
    return Intl.message(
      'forget password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `please check your email and password`
  String get checkYourEmailAndPassword {
    return Intl.message(
      'please check your email and password',
      name: 'checkYourEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `do you have an account?`
  String get haveAccount {
    return Intl.message(
      'do you have an account?',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message('Log in', name: 'login', desc: '', args: []);
  }

  /// `Please enter your name`
  String get validateName {
    return Intl.message(
      'Please enter your name',
      name: 'validateName',
      desc: '',
      args: [],
    );
  }

  /// `Passwords must have at least one non alphanumeric character, one uppercase, one number`
  String get validation2Password {
    return Intl.message(
      'Passwords must have at least one non alphanumeric character, one uppercase, one number',
      name: 'validation2Password',
      desc: '',
      args: [],
    );
  }

  /// `Account created successfully,click ok and go to login`
  String get successCreateAccount {
    return Intl.message(
      'Account created successfully,click ok and go to login',
      name: 'successCreateAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't Know What\nTo Cook?`
  String get dontKnowWhatToCook {
    return Intl.message(
      'Don\'t Know What\nTo Cook?',
      name: 'dontKnowWhatToCook',
      desc: '',
      args: [],
    );
  }

  /// `Search With Ingredients`
  String get searchWithIngredients {
    return Intl.message(
      'Search With Ingredients',
      name: 'searchWithIngredients',
      desc: '',
      args: [],
    );
  }

  /// `Your Ingredients`
  String get yourIngredients {
    return Intl.message(
      'Your Ingredients',
      name: 'yourIngredients',
      desc: '',
      args: [],
    );
  }

  /// `No Meals Found`
  String get noMealsFound {
    return Intl.message(
      'No Meals Found',
      name: 'noMealsFound',
      desc: '',
      args: [],
    );
  }

  /// `Search for Ingredient...`
  String get searchForIngredient {
    return Intl.message(
      'Search for Ingredient...',
      name: 'searchForIngredient',
      desc: '',
      args: [],
    );
  }

  /// `Recipes By Categories`
  String get recipesByCategories {
    return Intl.message(
      'Recipes By Categories',
      name: 'recipesByCategories',
      desc: '',
      args: [],
    );
  }

  /// `For Everytime`
  String get forEverytime {
    return Intl.message(
      'For Everytime',
      name: 'forEverytime',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `150+ recipe`
  String get recipeCount {
    return Intl.message('150+ recipe', name: 'recipeCount', desc: '', args: []);
  }

  /// `Breakfast`
  String get breakfast {
    return Intl.message('Breakfast', name: 'breakfast', desc: '', args: []);
  }

  /// `Lunch`
  String get lunch {
    return Intl.message('Lunch', name: 'lunch', desc: '', args: []);
  }

  /// `Dinner`
  String get dinner {
    return Intl.message('Dinner', name: 'dinner', desc: '', args: []);
  }

  /// `Invalid ingredient`
  String get invalidIngredient {
    return Intl.message(
      'Invalid ingredient',
      name: 'invalidIngredient',
      desc: '',
      args: [],
    );
  }

  /// `search with meal name`
  String get searchWithMealName {
    return Intl.message(
      'search with meal name',
      name: 'searchWithMealName',
      desc: '',
      args: [],
    );
  }

  /// `More Filters`
  String get MoreFilters {
    return Intl.message(
      'More Filters',
      name: 'MoreFilters',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get Filters {
    return Intl.message('Filters', name: 'Filters', desc: '', args: []);
  }

  /// `add to cart`
  String get addToCart {
    return Intl.message('add to cart', name: 'addToCart', desc: '', args: []);
  }

  /// `save`
  String get save {
    return Intl.message('save', name: 'save', desc: '', args: []);
  }

  /// `try again`
  String get tryAgain {
    return Intl.message('try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `search`
  String get search {
    return Intl.message('search', name: 'search', desc: '', args: []);
  }

  /// `serving`
  String get serving {
    return Intl.message('serving', name: 'serving', desc: '', args: []);
  }

  /// `update`
  String get update {
    return Intl.message('update', name: 'update', desc: '', args: []);
  }

  /// `ingredients`
  String get ingredients {
    return Intl.message('ingredients', name: 'ingredients', desc: '', args: []);
  }

  /// `instructions`
  String get instructions {
    return Intl.message(
      'instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get item {
    return Intl.message('items', name: 'item', desc: '', args: []);
  }

  // skipped getter for the 'Instructions:' key

  /// `Delete All`
  String get deleteAll {
    return Intl.message('Delete All', name: 'deleteAll', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Saved`
  String get saved {
    return Intl.message('Saved', name: 'saved', desc: '', args: []);
  }

  /// `Change`
  String get change {
    return Intl.message('Change', name: 'change', desc: '', args: []);
  }

  /// `Account`
  String get account {
    return Intl.message('Account', name: 'account', desc: '', args: []);
  }

  /// `Allergies`
  String get Allergies {
    return Intl.message('Allergies', name: 'Allergies', desc: '', args: []);
  }

  /// `Diseases`
  String get Diseases {
    return Intl.message('Diseases', name: 'Diseases', desc: '', args: []);
  }

  /// `Diabetes`
  String get Diabetes {
    return Intl.message('Diabetes', name: 'Diabetes', desc: '', args: []);
  }

  /// `High Blood Pressure`
  String get HighBloodPressure {
    return Intl.message(
      'High Blood Pressure',
      name: 'HighBloodPressure',
      desc: '',
      args: [],
    );
  }

  /// `High Cholesterol`
  String get HighCholesterol {
    return Intl.message(
      'High Cholesterol',
      name: 'HighCholesterol',
      desc: '',
      args: [],
    );
  }

  /// `Gout`
  String get Gout {
    return Intl.message('Gout', name: 'Gout', desc: '', args: []);
  }

  /// `Anemia (G6PD)`
  String get AnemiaG6PD {
    return Intl.message(
      'Anemia (G6PD)',
      name: 'AnemiaG6PD',
      desc: '',
      args: [],
    );
  }

  /// `Nuts`
  String get Nuts {
    return Intl.message('Nuts', name: 'Nuts', desc: '', args: []);
  }

  /// `Dairy`
  String get Dairy {
    return Intl.message('Dairy', name: 'Dairy', desc: '', args: []);
  }

  /// `Gluten`
  String get Gluten {
    return Intl.message('Gluten', name: 'Gluten', desc: '', args: []);
  }

  /// `Eggs`
  String get Eggs {
    return Intl.message('Eggs', name: 'Eggs', desc: '', args: []);
  }

  /// `Seafood`
  String get Seafood {
    return Intl.message('Seafood', name: 'Seafood', desc: '', args: []);
  }

  /// `Soy`
  String get Soy {
    return Intl.message('Soy', name: 'Soy', desc: '', args: []);
  }

  /// `Sesame`
  String get Sesame {
    return Intl.message('Sesame', name: 'Sesame', desc: '', args: []);
  }

  /// `min`
  String get minute {
    return Intl.message('min', name: 'minute', desc: '', args: []);
  }

  /// `protein`
  String get protein {
    return Intl.message('protein', name: 'protein', desc: '', args: []);
  }

  /// `carbs`
  String get carbs {
    return Intl.message('carbs', name: 'carbs', desc: '', args: []);
  }

  /// `fats`
  String get fats {
    return Intl.message('fats', name: 'fats', desc: '', args: []);
  }

  /// `cal`
  String get calories {
    return Intl.message('cal', name: 'calories', desc: '', args: []);
  }

  /// `sugar`
  String get sugar {
    return Intl.message('sugar', name: 'sugar', desc: '', args: []);
  }

  /// `not sutable to your case🙅‍♂️`
  String get dinger {
    return Intl.message(
      'not sutable to your case🙅‍♂️',
      name: 'dinger',
      desc: '',
      args: [],
    );
  }

  /// `recommended`
  String get recommended {
    return Intl.message('recommended', name: 'recommended', desc: '', args: []);
  }

  /// `search to build your recommendation`
  String get buildRecommendation {
    return Intl.message(
      'search to build your recommendation',
      name: 'buildRecommendation',
      desc: '',
      args: [],
    );
  }

  /// `Made Just  For\nYou`
  String get makeForYou {
    return Intl.message(
      'Made Just  For\nYou',
      name: 'makeForYou',
      desc: '',
      args: [],
    );
  }

  /// `Recommended Meals`
  String get recommendedMeals {
    return Intl.message(
      'Recommended Meals',
      name: 'recommendedMeals',
      desc: '',
      args: [],
    );
  }

  /// `Show More`
  String get showMore {
    return Intl.message('Show More', name: 'showMore', desc: '', args: []);
  }

  /// `Show Less`
  String get showLess {
    return Intl.message('Show Less', name: 'showLess', desc: '', args: []);
  }

  /// `search for\n a meal ?`
  String get seachForMeal {
    return Intl.message(
      'search for\n a meal ?',
      name: 'seachForMeal',
      desc: '',
      args: [],
    );
  }

  /// `Let us cook\n for you`
  String get letUsCockForYou {
    return Intl.message(
      'Let us cook\n for you',
      name: 'letUsCockForYou',
      desc: '',
      args: [],
    );
  }

  /// `Connection error. Check your internet.`
  String get error_connection {
    return Intl.message(
      'Connection error. Check your internet.',
      name: 'error_connection',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out with server.`
  String get error_connection_timeout {
    return Intl.message(
      'Connection timed out with server.',
      name: 'error_connection_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Request to server was cancelled.`
  String get error_cancelled {
    return Intl.message(
      'Request to server was cancelled.',
      name: 'error_cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout with server.`
  String get error_receive_timeout {
    return Intl.message(
      'Receive timeout with server.',
      name: 'error_receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Connection to server failed due to internet connection.`
  String get error_unknown {
    return Intl.message(
      'Connection to server failed due to internet connection.',
      name: 'error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout with server.`
  String get error_send_timeout {
    return Intl.message(
      'Send timeout with server.',
      name: 'error_send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong. Try again.`
  String get error_bad_response {
    return Intl.message(
      'Something went wrong. Try again.',
      name: 'error_bad_response',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong.`
  String get error_default {
    return Intl.message(
      'Something went wrong.',
      name: 'error_default',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error occurred.`
  String get error_unknown_occurred {
    return Intl.message(
      'Unknown error occurred.',
      name: 'error_unknown_occurred',
      desc: '',
      args: [],
    );
  }

  /// `Bad request`
  String get error_bad_request {
    return Intl.message(
      'Bad request',
      name: 'error_bad_request',
      desc: '',
      args: [],
    );
  }

  /// `Unauthorized access`
  String get error_unauthorized {
    return Intl.message(
      'Unauthorized access',
      name: 'error_unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Forbidden`
  String get error_forbidden {
    return Intl.message(
      'Forbidden',
      name: 'error_forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Resource not found`
  String get error_not_found {
    return Intl.message(
      'Resource not found',
      name: 'error_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error`
  String get error_server {
    return Intl.message(
      'Internal server error',
      name: 'error_server',
      desc: '',
      args: [],
    );
  }

  /// `Please select at least one ingrediant`
  String get Please_select_one_ingrediant {
    return Intl.message(
      'Please select at least one ingrediant',
      name: 'Please_select_one_ingrediant',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
