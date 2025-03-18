import 'package:ht_preferences_client/ht_preferences_client.dart';

/// {@template ht_preferences_inmemory}
/// In-memory implementation of the [HtPreferencesClient] interface.
/// {@endtemplate}
class HtPreferencesInMemory implements HtPreferencesClient {
  /// {@macro ht_preferences_inmemory}
  HtPreferencesInMemory()
      : _preferences = {},
        _throwError = false;

  final Map<String, dynamic> _preferences;

  /// Returns all preferences.
  Map<String, dynamic> get allPreferences => _preferences;

  bool _throwError;

  /// Sets whether to throw an error on the next operation. For testing only.
  // ignore: avoid_positional_boolean_parameters, use_setters_to_change_properties
  void setThrowError(bool value) {
    _throwError = value;
  }

  @override
  Future<String> getLanguage() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      return _preferences['language'] as String? ?? 'en';
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setLanguage(String language) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    if (language.length != 2) {
      throw InvalidLanguageException(language);
    }
    try {
      _preferences['language'] = language;
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<ThemeMode> getTheme() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final theme = _preferences['theme'] as String?;
      return ThemeMode.values.firstWhere(
        (e) => e.toString() == theme,
        orElse: () => ThemeMode.system,
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setTheme(ThemeMode theme) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['theme'] = theme.toString();
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<List<String>> getFollowedSourceIds() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      return List<String>.from(
        _preferences['followedSourceIds'] as List? ?? [],
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setFollowedSourceIds(List<String> sources) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['followedSourceIds'] = sources;
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> addFollowedSourceId(String source) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final sources = await getFollowedSourceIds();
      if (!sources.contains(source)) {
        sources.add(source);
        await setFollowedSourceIds(sources);
      }
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeFollowedSourceId(String source) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final sources = await getFollowedSourceIds();
      if (!sources.contains(source)) {
        throw SourceNotFoundException(source);
      }
      sources.remove(source);
      await setFollowedSourceIds(sources);
    } catch (e) {
      if (e is SourceNotFoundException) {
        rethrow;
      }
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<List<String>> getFollowedCategoryIds() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      return List<String>.from(
        _preferences['followedCategoryIds'] as List? ?? [],
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setFollowedCategoryIds(List<String> categories) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['followedCategoryIds'] = categories;
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> addFollowedCategoryId(String category) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final categories = await getFollowedCategoryIds();
      if (!categories.contains(category)) {
        categories.add(category);
        await setFollowedCategoryIds(categories);
      }
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeFollowedCategoryId(String category) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final categories = await getFollowedCategoryIds();
      if (!categories.contains(category)) {
        throw CategoryNotFoundException(category);
      }
      categories.remove(category);
      await setFollowedCategoryIds(categories);
    } catch (e) {
      if (e is CategoryNotFoundException) {
        rethrow;
      }
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<List<String>> getFollowedEventCountryIds() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      return List<String>.from(
        _preferences['followedEventCountryIds'] as List? ?? [],
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setFollowedEventCountryIds(List<String> countries) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['followedEventCountryIds'] = countries;
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> addFollowedEventCountryId(String country) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final countries = await getFollowedEventCountryIds();
      if (!countries.contains(country)) {
        countries.add(country);
        await setFollowedEventCountryIds(countries);
      }
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeFollowedEventCountryId(String country) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final countries = await getFollowedEventCountryIds();
      if (!countries.contains(country)) {
        throw CountryNotFoundException(country);
      }
      countries.remove(country);
      await setFollowedEventCountryIds(countries);
    } catch (e) {
      if (e is CountryNotFoundException) {
        rethrow;
      }
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeAllFollowedSourceIds() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      await setFollowedSourceIds([]);
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeAllFollowedCategoryIds() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      await setFollowedCategoryIds([]);
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeAllFollowedEventCountryIds() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      await setFollowedEventCountryIds([]);
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<HeadlineArticleTextSize> getHeadlineArticleTextSize() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final textSize = _preferences['headlineArticleTextSize'] as String?;
      return HeadlineArticleTextSize.values.firstWhere(
        (e) => e.toString() == textSize,
        orElse: () => HeadlineArticleTextSize.medium,
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setHeadlineArticleTextSize(
    HeadlineArticleTextSize textSize,
  ) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['headlineArticleTextSize'] = textSize.toString();
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<AppFontSize> getAppFontSize() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final fontSize = _preferences['appFontSize'] as String?;
      return AppFontSize.values.firstWhere(
        (e) => e.toString() == fontSize,
        orElse: () => AppFontSize.medium,
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setAppFontSize(AppFontSize fontSize) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['appFontSize'] = fontSize.toString();
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<List<String>> getSavedHeadlines() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      return List<String>.from(_preferences['savedHeadlines'] as List? ?? []);
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setSavedHeadlines(List<String> headlines) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['savedHeadlines'] = headlines;
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> addSavedHeadline(String headline) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final headlines = await getSavedHeadlines();
      if (!headlines.contains(headline)) {
        headlines.add(headline);
        await setSavedHeadlines(headlines);
      }
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeSavedHeadline(String headline) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final headlines = await getSavedHeadlines();
      if (!headlines.contains(headline)) {
        throw HeadlineNotFoundException(headline);
      }
      headlines.remove(headline);
      await setSavedHeadlines(headlines);
    } catch (e) {
      if (e is HeadlineNotFoundException) {
        rethrow;
      }
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> removeAllSavedHeadlines() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      await setSavedHeadlines([]);
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<ContentDensity> getContentDensity() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final contentDensity = _preferences['contentDensity'] as String?;
      return ContentDensity.values.firstWhere(
        (e) => e.toString() == contentDensity,
        orElse: () => ContentDensity.comfortable,
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setContentDensity(ContentDensity contentDensity) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['contentDensity'] = contentDensity.toString();
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<FeedTileLayout> getFeedTileLayout() async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      final feedTileLayout = _preferences['feedTileLayout'] as String?;
      return FeedTileLayout.values.firstWhere(
        (e) => e.toString() == feedTileLayout,
        orElse: () => FeedTileLayout.imageStart,
      );
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }

  @override
  Future<void> setFeedTileLayout(FeedTileLayout feedTileLayout) async {
    if (_throwError) {
      throw PreferencesStorageException();
    }
    try {
      _preferences['feedTileLayout'] = feedTileLayout.toString();
    } catch (e) {
      throw PreferencesStorageException(e.toString());
    }
  }
}
