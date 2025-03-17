//ignore_for_file: lines_longer_than_80_chars

import 'package:ht_preferences_client/ht_preferences_client.dart';
import 'package:ht_preferences_inmemory/src/ht_preferences_inmemory.dart';
import 'package:test/test.dart';

void main() {
  group('HtPreferencesInMemory', () {
    late HtPreferencesClient client;

    setUp(() {
      client = HtPreferencesInMemory();
    });

    test('getLanguage returns default language', () async {
      expect(await client.getLanguage(), 'en');
    });

    test('setLanguage updates language', () async {
      await client.setLanguage('fr');
      expect(await client.getLanguage(), 'fr');
    });

    test('setLanguage throws InvalidLanguageException for invalid language',
        () async {
      expect(
        () => client.setLanguage('invalid'),
        throwsA(isA<InvalidLanguageException>()),
      );
    });

    test('getTheme returns default theme', () async {
      expect(await client.getTheme(), ThemeMode.system);
    });

    test('setTheme updates theme', () async {
      await client.setTheme(ThemeMode.dark);
      expect(await client.getTheme(), ThemeMode.dark);
    });

    test('getFavoriteSources returns empty list by default', () async {
      expect(await client.getFavoriteSources(), isEmpty);
    });

    test('setFavoriteSources updates favorite sources', () async {
      await client.setFavoriteSources(['source1', 'source2']);
      expect(await client.getFavoriteSources(), ['source1', 'source2']);
    });

    test('addFavoriteSource adds source to favorites', () async {
      await client.addFavoriteSource('source1');
      expect(await client.getFavoriteSources(), ['source1']);
    });

    test('removeFavoriteSource removes source from favorites', () async {
      await client.addFavoriteSource('source1');
      await client.removeFavoriteSource('source1');
      expect(await client.getFavoriteSources(), isEmpty);
    });

    test(
        'removeFavoriteSource throws SourceNotFoundException when source is not in favorites',
        () async {
      expect(
        () => client.removeFavoriteSource('source1'),
        throwsA(isA<SourceNotFoundException>()),
      );
    });
     test('getFavoriteCategories returns empty list by default', () async {
      expect(await client.getFavoriteCategories(), isEmpty);
    });

    test('setFavoriteCategories updates favorite categories', () async {
      await client.setFavoriteCategories(['category1', 'category2']);
      expect(await client.getFavoriteCategories(), ['category1', 'category2']);
    });

    test('addFavoriteCategory adds category to favorites', () async {
      await client.addFavoriteCategory('category1');
      expect(await client.getFavoriteCategories(), ['category1']);
    });

    test('removeFavoriteCategory removes category from favorites', () async {
      await client.addFavoriteCategory('category1');
      await client.removeFavoriteCategory('category1');
      expect(await client.getFavoriteCategories(), isEmpty);
    });

    test(
        'removeFavoriteCategory throws CategoryNotFoundException when category is not in favorites',
        () async {
      expect(
        () => client.removeFavoriteCategory('category1'),
        throwsA(isA<CategoryNotFoundException>()),
      );
    });

    test('getFavoriteEventCountries returns empty list by default', () async {
      expect(await client.getFavoriteEventCountries(), isEmpty);
    });

    test('setFavoriteEventCountries updates favorite countries', () async {
      await client.setFavoriteEventCountries(['country1', 'country2']);
      expect(await client.getFavoriteEventCountries(), ['country1', 'country2']);
    });

    test('addFavoriteEventCountry adds country to favorites', () async {
      await client.addFavoriteEventCountry('country1');
      expect(await client.getFavoriteEventCountries(), ['country1']);
    });

    test('removeFavoriteEventCountry removes country from favorites', () async {
      await client.addFavoriteEventCountry('country1');
      await client.removeFavoriteEventCountry('country1');
      expect(await client.getFavoriteEventCountries(), isEmpty);
    });

    test(
        'removeFavoriteEventCountry throws CountryNotFoundException when country is not in favorites',
        () async {
      expect(
        () => client.removeFavoriteEventCountry('country1'),
        throwsA(isA<CountryNotFoundException>()),
      );
    });
  });
}
