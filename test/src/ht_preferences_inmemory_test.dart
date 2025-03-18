import 'package:ht_preferences_inmemory/ht_preferences_inmemory.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHtPreferencesClient extends Mock implements HtPreferencesClient {}

void main() {
  group('HtPreferencesInMemory', () {
    late HtPreferencesInMemory preferences;

    setUp(() {
      preferences = HtPreferencesInMemory();
    });

    test('can be instantiated', () {
      expect(HtPreferencesInMemory(), isNotNull);
    });

    group('getLanguage', () {
      test('returns default language when not set', () async {
        expect(await preferences.getLanguage(), equals('en'));
      });

      test('returns set language', () async {
        await preferences.setLanguage('fr');
        expect(await preferences.getLanguage(), equals('fr'));
      });
    });

    group('setLanguage', () {
      test('throws InvalidLanguageException for invalid language code',
          () async {
        expect(
          () async => preferences.setLanguage('invalid'),
          throwsA(isA<InvalidLanguageException>()),
        );
      });
    });

    group('getTheme', () {
      test('returns default theme when not set', () async {
        expect(await preferences.getTheme(), equals(ThemeMode.system));
      });

      test('returns set theme', () async {
        await preferences.setTheme(ThemeMode.dark);
        expect(await preferences.getTheme(), equals(ThemeMode.dark));
      });
    });

    group('getFollowedSourceIds', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getFollowedSourceIds(), isEmpty);
      });

      test('returns set source IDs', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        expect(
          await preferences.getFollowedSourceIds(),
          equals(['source1', 'source2']),
        );
      });
    });

    group('addFollowedSourceId', () {
      test('adds a source ID', () async {
        await preferences.addFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), equals(['source1']));
      });

      test('does not add duplicate source IDs', () async {
        await preferences.addFollowedSourceId('source1');
        await preferences.addFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), equals(['source1']));
      });
    });

    group('removeFollowedSourceId', () {
      test('removes a source ID', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        await preferences.removeFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), equals(['source2']));
      });

      test('throws SourceNotFoundException when source is not found', () async {
        expect(
          () async => preferences.removeFollowedSourceId('source1'),
          throwsA(isA<SourceNotFoundException>()),
        );
      });
    });

    group('removeAllFollowedSourceIds', () {
      test('removes all source IDs', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        await preferences.removeAllFollowedSourceIds();
        expect(await preferences.getFollowedSourceIds(), isEmpty);
      });
    });

    group('getFollowedCategoryIds', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getFollowedCategoryIds(), isEmpty);
      });

      test('returns set category IDs', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        expect(
          await preferences.getFollowedCategoryIds(),
          equals(['category1', 'category2']),
        );
      });
    });

    group('addFollowedCategoryId', () {
      test('adds a category ID', () async {
        await preferences.addFollowedCategoryId('category1');
        expect(
          await preferences.getFollowedCategoryIds(),
          equals(['category1']),
        );
      });

      test('does not add duplicate category IDs', () async {
        await preferences.addFollowedCategoryId('category1');
        await preferences.addFollowedCategoryId('category1');
        expect(
          await preferences.getFollowedCategoryIds(),
          equals(['category1']),
        );
      });
    });

    group('removeFollowedCategoryId', () {
      test('removes a category ID', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        await preferences.removeFollowedCategoryId('category1');
        expect(
          await preferences.getFollowedCategoryIds(),
          equals(['category2']),
        );
      });

      test('throws CategoryNotFoundException when category is not found',
          () async {
        expect(
          () async => preferences.removeFollowedCategoryId('category1'),
          throwsA(isA<CategoryNotFoundException>()),
        );
      });
    });

    group('removeAllFollowedCategoryIds', () {
      test('removes all category IDs', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        await preferences.removeAllFollowedCategoryIds();
        expect(await preferences.getFollowedCategoryIds(), isEmpty);
      });
    });

    group('getFollowedEventCountryIds', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getFollowedEventCountryIds(), isEmpty);
      });

      test('returns set country IDs', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(['country1', 'country2']),
        );
      });
    });

    group('addFollowedEventCountryId', () {
      test('adds a country ID', () async {
        await preferences.addFollowedEventCountryId('country1');
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(['country1']),
        );
      });

      test('does not add duplicate country IDs', () async {
        await preferences.addFollowedEventCountryId('country1');
        await preferences.addFollowedEventCountryId('country1');
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(['country1']),
        );
      });
    });

    group('removeFollowedEventCountryId', () {
      test('removes a country ID', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        await preferences.removeFollowedEventCountryId('country1');
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(['country2']),
        );
      });

      test('throws CountryNotFoundException when country is not found',
          () async {
        expect(
          () async => preferences.removeFollowedEventCountryId('country1'),
          throwsA(isA<CountryNotFoundException>()),
        );
      });
    });

    group('removeAllFollowedEventCountryIds', () {
      test('removes all country IDs', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        await preferences.removeAllFollowedEventCountryIds();
        expect(await preferences.getFollowedEventCountryIds(), isEmpty);
      });
    });

    group('getHeadlineArticleTextSize', () {
      test('returns default text size when not set', () async {
        expect(
          await preferences.getHeadlineArticleTextSize(),
          equals(HeadlineArticleTextSize.medium),
        );
      });

      test('returns set text size', () async {
        await preferences.setHeadlineArticleTextSize(
          HeadlineArticleTextSize.large,
        );
        expect(
          await preferences.getHeadlineArticleTextSize(),
          equals(HeadlineArticleTextSize.large),
        );
      });
    });

    group('getAppFontSize', () {
      test('returns default font size when not set', () async {
        expect(await preferences.getAppFontSize(), equals(AppFontSize.medium));
      });

      test('returns set font size', () async {
        await preferences.setAppFontSize(AppFontSize.large);
        expect(await preferences.getAppFontSize(), equals(AppFontSize.large));
      });
    });

    group('getSavedHeadlines', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getSavedHeadlines(), isEmpty);
      });

      test('returns set headlines', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        expect(
          await preferences.getSavedHeadlines(),
          equals(['headline1', 'headline2']),
        );
      });
    });

    group('addSavedHeadline', () {
      test('adds a headline', () async {
        await preferences.addSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), equals(['headline1']));
      });

      test('does not add duplicate headlines', () async {
        await preferences.addSavedHeadline('headline1');
        await preferences.addSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), equals(['headline1']));
      });
    });

    group('removeSavedHeadline', () {
      test('removes a headline', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        await preferences.removeSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), equals(['headline2']));
      });

      test('throws HeadlineNotFoundException when headline is not found',
          () async {
        expect(
          () async => preferences.removeSavedHeadline('headline1'),
          throwsA(isA<HeadlineNotFoundException>()),
        );
      });
    });

    group('removeAllSavedHeadlines', () {
      test('removes all headlines', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        await preferences.removeAllSavedHeadlines();
        expect(await preferences.getSavedHeadlines(), isEmpty);
      });
    });

    group('getContentDensity', () {
      test('returns default content density when not set', () async {
        expect(
          await preferences.getContentDensity(),
          equals(ContentDensity.comfortable),
        );
      });

      test('returns set content density', () async {
        await preferences.setContentDensity(ContentDensity.compact);
        expect(
          await preferences.getContentDensity(),
          equals(ContentDensity.compact),
        );
      });
    });

    group('getFeedTileLayout', () {
      test('returns default feed tile layout when not set', () async {
        expect(
          await preferences.getFeedTileLayout(),
          equals(FeedTileLayout.imageStart),
        );
      });

      test('returns set feed tile layout', () async {
        await preferences.setFeedTileLayout(FeedTileLayout.imageTop);
        expect(
          await preferences.getFeedTileLayout(),
          equals(FeedTileLayout.imageTop),
        );
      });
    });
  });
}
