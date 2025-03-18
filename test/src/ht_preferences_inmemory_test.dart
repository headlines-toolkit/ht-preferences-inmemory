//
// ignore_for_file: inference_failure_on_collection_literal

import 'package:ht_preferences_client/ht_preferences_client.dart';
import 'package:ht_preferences_inmemory/src/ht_preferences_inmemory.dart';
import 'package:test/test.dart';

void main() {
  group('HtPreferencesInMemory', () {
    late HtPreferencesInMemory preferences;

    setUp(() {
      preferences = HtPreferencesInMemory();
    });

    group('getLanguage', () {
      test('returns default language when not set', () async {
        expect(await preferences.getLanguage(), 'en');
      });

      test('returns correct language after setting', () async {
        await preferences.setLanguage('fr');
        expect(await preferences.getLanguage(), 'fr');
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
        expect(await preferences.getTheme(), ThemeMode.system);
      });

      test('returns correct theme after setting', () async {
        await preferences.setTheme(ThemeMode.dark);
        expect(await preferences.getTheme(), ThemeMode.dark);
      });
    });

    group('setTheme', () {
      test('sets theme correctly', () async {
        await preferences.setTheme(ThemeMode.light);
        expect(preferences.allPreferences['theme'], ThemeMode.light.toString());
      });
    });

    group('getFollowedSourceIds', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getFollowedSourceIds(), []);
      });

      test('returns correct list after setting', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        expect(
          await preferences.getFollowedSourceIds(),
          ['source1', 'source2'],
        );
      });
    });

    group('setFollowedSourceIds', () {
      test('sets followed source IDs correctly', () async {
        await preferences.setFollowedSourceIds(['source1']);
        expect(
          preferences.allPreferences['followedSourceIds'],
          ['source1'],
        );
      });
    });

    group('addFollowedSourceId', () {
      test('adds a new source ID', () async {
        await preferences.addFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), ['source1']);
      });

      test('does not add duplicate source IDs', () async {
        await preferences.addFollowedSourceId('source1');
        await preferences.addFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), ['source1']);
      });
    });

    group('removeFollowedSourceId', () {
      test('removes an existing source ID', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        await preferences.removeFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), ['source2']);
      });

      test('throws SourceNotFoundException for non-existent source ID',
          () async {
        expect(
          () async => preferences.removeFollowedSourceId('source1'),
          throwsA(isA<SourceNotFoundException>()),
        );
      });
    });

    group('getFollowedCategoryIds', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getFollowedCategoryIds(), []);
      });

      test('returns correct list after setting', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        expect(
          await preferences.getFollowedCategoryIds(),
          ['category1', 'category2'],
        );
      });
    });

    group('setFollowedCategoryIds', () {
      test('sets followed category IDs correctly', () async {
        await preferences.setFollowedCategoryIds(['category1']);
        expect(
          preferences.allPreferences['followedCategoryIds'],
          ['category1'],
        );
      });
    });

    group('addFollowedCategoryId', () {
      test('adds a new category ID', () async {
        await preferences.addFollowedCategoryId('category1');
        expect(await preferences.getFollowedCategoryIds(), ['category1']);
      });

      test('does not add duplicate category IDs', () async {
        await preferences.addFollowedCategoryId('category1');
        await preferences.addFollowedCategoryId('category1');
        expect(await preferences.getFollowedCategoryIds(), ['category1']);
      });
    });

    group('removeFollowedCategoryId', () {
      test('removes an existing category ID', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        await preferences.removeFollowedCategoryId('category1');
        expect(await preferences.getFollowedCategoryIds(), ['category2']);
      });

      test('throws CategoryNotFoundException for non-existent category ID',
          () async {
        expect(
          () async => preferences.removeFollowedCategoryId('category1'),
          throwsA(isA<CategoryNotFoundException>()),
        );
      });
    });

    group('getFollowedEventCountryIds', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getFollowedEventCountryIds(), []);
      });

      test('returns correct list after setting', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        expect(
          await preferences.getFollowedEventCountryIds(),
          ['country1', 'country2'],
        );
      });
    });

    group('setFollowedEventCountryIds', () {
      test('sets followed event country IDs correctly', () async {
        await preferences.setFollowedEventCountryIds(['country1']);
        expect(
          preferences.allPreferences['followedEventCountryIds'],
          ['country1'],
        );
      });
    });

    group('addFollowedEventCountryId', () {
      test('adds a new country ID', () async {
        await preferences.addFollowedEventCountryId('country1');
        expect(await preferences.getFollowedEventCountryIds(), ['country1']);
      });

      test('does not add duplicate country IDs', () async {
        await preferences.addFollowedEventCountryId('country1');
        await preferences.addFollowedEventCountryId('country1');
        expect(await preferences.getFollowedEventCountryIds(), ['country1']);
      });
    });

    group('removeFollowedEventCountryId', () {
      test('removes an existing country ID', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        await preferences.removeFollowedEventCountryId('country1');
        expect(await preferences.getFollowedEventCountryIds(), ['country2']);
      });

      test('throws CountryNotFoundException for non-existent country ID',
          () async {
        expect(
          () async => preferences.removeFollowedEventCountryId('country1'),
          throwsA(isA<CountryNotFoundException>()),
        );
      });
    });

    group('removeAllFollowedSourceIds', () {
      test('removes all followed source IDs', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        await preferences.removeAllFollowedSourceIds();
        expect(await preferences.getFollowedSourceIds(), []);
      });
    });

    group('removeAllFollowedCategoryIds', () {
      test('removes all followed category IDs', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        await preferences.removeAllFollowedCategoryIds();
        expect(await preferences.getFollowedCategoryIds(), []);
      });
    });

    group('removeAllFollowedEventCountryIds', () {
      test('removes all followed event country IDs', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        await preferences.removeAllFollowedEventCountryIds();
        expect(await preferences.getFollowedEventCountryIds(), []);
      });
    });

    group('getHeadlineArticleTextSize', () {
      test('returns default value when not set', () async {
        expect(
          await preferences.getHeadlineArticleTextSize(),
          HeadlineArticleTextSize.medium,
        );
      });

      test('returns correct value after setting', () async {
        await preferences
            .setHeadlineArticleTextSize(HeadlineArticleTextSize.large);
        expect(
          await preferences.getHeadlineArticleTextSize(),
          HeadlineArticleTextSize.large,
        );
      });
    });

    group('setHeadlineArticleTextSize', () {
      test('sets headline article text size correctly', () async {
        await preferences.setHeadlineArticleTextSize(
          HeadlineArticleTextSize.small,
        );
        expect(
          preferences.allPreferences['headlineArticleTextSize'],
          HeadlineArticleTextSize.small.toString(),
        );
      });
    });

    group('getAppFontSize', () {
      test('returns default value when not set', () async {
        expect(await preferences.getAppFontSize(), AppFontSize.medium);
      });

      test('returns correct value after setting', () async {
        await preferences.setAppFontSize(AppFontSize.large);
        expect(await preferences.getAppFontSize(), AppFontSize.large);
      });
    });

    group('setAppFontSize', () {
      test('sets app font size correctly', () async {
        await preferences.setAppFontSize(AppFontSize.small);
        expect(
          preferences.allPreferences['appFontSize'],
          AppFontSize.small.toString(),
        );
      });
    });

    group('getSavedHeadlines', () {
      test('returns empty list when not set', () async {
        expect(await preferences.getSavedHeadlines(), []);
      });

      test('returns correct list after setting', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        expect(
          await preferences.getSavedHeadlines(),
          ['headline1', 'headline2'],
        );
      });
    });

    group('setSavedHeadlines', () {
      test('sets saved headlines correctly', () async {
        await preferences.setSavedHeadlines(['headline1']);
        expect(
          preferences.allPreferences['savedHeadlines'],
          ['headline1'],
        );
      });
    });

    group('addSavedHeadline', () {
      test('adds a new headline', () async {
        await preferences.addSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), ['headline1']);
      });

      test('does not add duplicate headlines', () async {
        await preferences.addSavedHeadline('headline1');
        await preferences.addSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), ['headline1']);
      });
    });

    group('removeSavedHeadline', () {
      test('removes an existing headline', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        await preferences.removeSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), ['headline2']);
      });

      test('throws HeadlineNotFoundException for non-existent headline',
          () async {
        expect(
          () async => preferences.removeSavedHeadline('headline1'),
          throwsA(isA<HeadlineNotFoundException>()),
        );
      });
    });

    group('removeAllSavedHeadlines', () {
      test('removes all saved headlines', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        await preferences.removeAllSavedHeadlines();
        expect(await preferences.getSavedHeadlines(), []);
      });
    });

    group('getContentDensity', () {
      test('returns default value when not set', () async {
        expect(
          await preferences.getContentDensity(),
          ContentDensity.comfortable,
        );
      });

      test('returns correct value after setting', () async {
        await preferences.setContentDensity(ContentDensity.compact);
        expect(await preferences.getContentDensity(), ContentDensity.compact);
      });
    });

    group('setContentDensity', () {
      test('sets content density correctly', () async {
        await preferences.setContentDensity(ContentDensity.compact);
        expect(
          preferences.allPreferences['contentDensity'],
          ContentDensity.compact.toString(),
        );
      });
    });

    group('getFeedTileLayout', () {
      test('returns default value when not set', () async {
        expect(
          await preferences.getFeedTileLayout(),
          FeedTileLayout.imageStart,
        );
      });

      test('returns correct value after setting', () async {
        await preferences.setFeedTileLayout(FeedTileLayout.imageStart);
        expect(
          await preferences.getFeedTileLayout(),
          FeedTileLayout.imageStart,
        );
      });
    });

    group('setFeedTileLayout', () {
      test('sets feed tile layout correctly', () async {
        await preferences.setFeedTileLayout(FeedTileLayout.imageStart);
        expect(
          preferences.allPreferences['feedTileLayout'],
          FeedTileLayout.imageStart.toString(),
        );
      });
    });
  });
  group('PreferencesStorageException', () {
    late HtPreferencesInMemory preferences;
    setUp(() {
      preferences = HtPreferencesInMemory()..setThrowError(true);
    });

    tearDown(() {
      preferences.setThrowError(false);
    });

    test('getLanguage throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getLanguage(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setLanguage throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setLanguage('en'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getTheme throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getTheme(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setTheme throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setTheme(ThemeMode.system),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFollowedSourceIds throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getFollowedSourceIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFollowedSourceIds throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setFollowedSourceIds([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addFollowedSourceId throws PreferencesStorageException', () async {
      expect(
        () async => preferences.addFollowedSourceId('source1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeFollowedSourceId throws PreferencesStorageException', () async {
      // Need to add a source first, or it will throw SourceNotFoundException
      preferences.setThrowError(false);
      await preferences.addFollowedSourceId('source1');
      preferences.setThrowError(true);
      expect(
        () async => preferences.removeFollowedSourceId('source1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFollowedCategoryIds throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getFollowedCategoryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFollowedCategoryIds throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setFollowedCategoryIds([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addFollowedCategoryId throws PreferencesStorageException', () async {
      expect(
        () async => preferences.addFollowedCategoryId('category1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeFollowedCategoryId throws PreferencesStorageException',
        () async {
      preferences.setThrowError(false);
      await preferences.addFollowedCategoryId('category1');
      preferences.setThrowError(true);
      expect(
        () async => preferences.removeFollowedCategoryId('category1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFollowedEventCountryIds throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.getFollowedEventCountryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFollowedEventCountryIds throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.setFollowedEventCountryIds([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addFollowedEventCountryId throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.addFollowedEventCountryId('country1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeFollowedEventCountryId throws PreferencesStorageException',
        () async {
      preferences.setThrowError(false);
      await preferences.addFollowedEventCountryId('country1');
      preferences.setThrowError(true);
      expect(
        () async => preferences.removeFollowedEventCountryId('country1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllFollowedSourceIds throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.removeAllFollowedSourceIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllFollowedCategoryIds throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.removeAllFollowedCategoryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllFollowedEventCountryIds throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.removeAllFollowedEventCountryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getHeadlineArticleTextSize throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.getHeadlineArticleTextSize(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setHeadlineArticleTextSize throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences
            .setHeadlineArticleTextSize(HeadlineArticleTextSize.medium),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getAppFontSize throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getAppFontSize(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setAppFontSize throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setAppFontSize(AppFontSize.medium),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getSavedHeadlines throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getSavedHeadlines(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setSavedHeadlines throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setSavedHeadlines([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addSavedHeadline throws PreferencesStorageException', () async {
      expect(
        () async => preferences.addSavedHeadline('headline1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeSavedHeadline throws PreferencesStorageException', () async {
      preferences.setThrowError(false);
      await preferences.addSavedHeadline('headline1');
      preferences.setThrowError(true);
      expect(
        () async => preferences.removeSavedHeadline('headline1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllSavedHeadlines throws PreferencesStorageException',
        () async {
      expect(
        () async => preferences.removeAllSavedHeadlines(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getContentDensity throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getContentDensity(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setContentDensity throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setContentDensity(ContentDensity.comfortable),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFeedTileLayout throws PreferencesStorageException', () async {
      expect(
        () async => preferences.getFeedTileLayout(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFeedTileLayout throws PreferencesStorageException', () async {
      expect(
        () async => preferences.setFeedTileLayout(FeedTileLayout.imageStart),
        throwsA(isA<PreferencesStorageException>()),
      );
    });
  });
}
