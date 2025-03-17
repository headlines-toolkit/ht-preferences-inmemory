//
//ignore_for_file: lines_longer_than_80_chars

import 'package:ht_preferences_client/ht_preferences_client.dart';

/// {@template ht_preferences_inmemory}
/// An in-memory implementation of [HtPreferencesClient].
/// {@endtemplate}
class HtPreferencesInMemory implements HtPreferencesClient {
  /// {@macro ht_preferences_inmemory}
  HtPreferencesInMemory();

  String _language = 'en';
  ThemeMode _theme = ThemeMode.system;
  final List<String> _favoriteSources = [];
  final List<String> _favoriteCategories = [];
  final List<String> _favoriteEventCountries = [];

  @override
  Future<String> getLanguage() async {
    return _language;
  }

  @override
  Future<void> setLanguage(String language) async {
    if (language.isEmpty || language.length != 2) {
      throw InvalidLanguageException(language);
    }
    _language = language;
  }

  @override
  Future<ThemeMode> getTheme() async {
    return _theme;
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    _theme = theme;
  }

  @override
  Future<List<String>> getFavoriteSources() async {
    return _favoriteSources;
  }

  @override
  Future<void> setFavoriteSources(List<String> sources) async {
    _favoriteSources
      ..clear()
      ..addAll(sources);
  }

  @override
  Future<void> addFavoriteSource(String source) async {
    _favoriteSources.add(source);
  }

  @override
  Future<void> removeFavoriteSource(String source) async {
    if (!_favoriteSources.contains(source)) {
      throw SourceNotFoundException(source);
    }
    _favoriteSources.remove(source);
  }

  @override
  Future<List<String>> getFavoriteCategories() async {
    return _favoriteCategories;
  }

  @override
  Future<void> setFavoriteCategories(List<String> categories) async {
    _favoriteCategories
      ..clear()
      ..addAll(categories);
  }

  @override
  Future<void> addFavoriteCategory(String category) async {
    _favoriteCategories.add(category);
  }

  @override
  Future<void> removeFavoriteCategory(String category) async {
    if (!_favoriteCategories.contains(category)) {
      throw CategoryNotFoundException(category);
    }
    _favoriteCategories.remove(category);
  }

  @override
  Future<List<String>> getFavoriteEventCountries() async {
    return _favoriteEventCountries;
  }

  @override
  Future<void> setFavoriteEventCountries(List<String> countries) async {
    _favoriteEventCountries
      ..clear()
      ..addAll(countries);
  }

  @override
  Future<void> addFavoriteEventCountry(String country) async {
    _favoriteEventCountries.add(country);
  }

  @override
  Future<void> removeFavoriteEventCountry(String country) async {
    if (!_favoriteEventCountries.contains(country)) {
      throw CountryNotFoundException(country);
    }
    _favoriteEventCountries.remove(country);
  }
}
