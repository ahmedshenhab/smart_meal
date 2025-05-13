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

  /// `Calories`
  String get calories {
    return Intl.message('Calories', name: 'calories', desc: '', args: []);
  }

  /// `Protein`
  String get protein {
    return Intl.message('Protein', name: 'protein', desc: '', args: []);
  }

  /// `Sugar`
  String get sugar {
    return Intl.message('Sugar', name: 'sugar', desc: '', args: []);
  }

  /// `Fats`
  String get fats {
    return Intl.message('Fats', name: 'fats', desc: '', args: []);
  }

  /// `Carbs`
  String get carbs {
    return Intl.message('Carbs', name: 'carbs', desc: '', args: []);
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
