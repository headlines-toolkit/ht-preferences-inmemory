//
// ignore_for_file: lines_longer_than_80_chars

import 'package:ht_preferences_client/ht_preferences_client.dart';
import 'package:ht_preferences_inmemory/src/ht_preferences_inmemory.dart';
import 'package:test/test.dart';

void main() {
  group('HtPreferencesInMemory', () {
    late HtPreferencesInMemory preferences;

    setUp(() {
      preferences = HtPreferencesInMemory.test({});
    });

    group('Test Constructor', () {
      test('Initializes preferences correctly', () async {
        final testPreferences = {'language': 'fr'};
        final preferences = HtPreferencesInMemory.test(testPreferences);
        expect(await preferences.getLanguage(), equals('fr'));
      });
    });

    group('Language', () {
      test('getLanguage returns default value "en"', () async {
        expect(await preferences.getLanguage(), equals('en'));
      });

      test('setLanguage and getLanguage work correctly', () async {
        await preferences.setLanguage('ar');
        expect(await preferences.getLanguage(), equals('ar'));
      });

      test('setLanguage throws InvalidLanguageException for invalid language',
          () async {
        expect(
          () async => preferences.setLanguage('invalid'),
          throwsA(isA<InvalidLanguageException>()),
        );
      });
    });

    group('PreferencesStorageException - Language', () {
      test('getLanguage throws PreferencesStorageException on error', () async {
        final preferences = HtPreferencesInMemory.test({'language': 123});
        expect(
          () async => await preferences.getLanguage(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test('setLanguage throws PreferencesStorageException on error', () async {
        final preferences = HtPreferencesInMemory.test({'language': 123});
        expect(
          () async => await preferences.setLanguage('ar'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
    });

    group('Theme', () {
      test('getTheme returns default value ThemeMode.system', () async {
        expect(await preferences.getTheme(), equals(ThemeMode.system));
      });

      test('setTheme and getTheme work correctly', () async {
        await preferences.setTheme(ThemeMode.dark);
        expect(await preferences.getTheme(), equals(ThemeMode.dark));
      });
    });

    group('PreferencesStorageException - Theme', () {
      test('getTheme throws PreferencesStorageException on error', () async {
        final preferences = HtPreferencesInMemory.test({'theme': 123});
        expect(
          () async => await preferences.getTheme(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test('setTheme throws PreferencesStorageException on error', () async {
        final preferences = HtPreferencesInMemory.test({'theme': 123});
        expect(
          () async => await preferences.setTheme(ThemeMode.dark),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
    });

    group('Followed Source IDs', () {
      test('getFollowedSourceIds returns an empty list by default', () async {
        expect(await preferences.getFollowedSourceIds(), equals([]));
      });

      test('setFollowedSourceIds sets the list of followed source IDs',
          () async {
        final sourceIds = ['source1', 'source2'];
        await preferences.setFollowedSourceIds(sourceIds);
        expect(await preferences.getFollowedSourceIds(), equals(sourceIds));
      });

      test('addFollowedSourceId adds a source ID to the list', () async {
        await preferences.addFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), equals(['source1']));

        // Test duplicate
        await preferences.addFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), equals(['source1']));
      });

      test('removeFollowedSourceId removes a source ID and throws if not found',
          () async {
        await preferences.addFollowedSourceId('source1');
        await preferences.removeFollowedSourceId('source1');
        expect(await preferences.getFollowedSourceIds(), equals([]));

        expect(
          () async => preferences.removeFollowedSourceId('source1'),
          throwsA(isA<SourceNotFoundException>()),
        );
      });

      test('removeAllFollowedSourceIds clears the list', () async {
        await preferences.setFollowedSourceIds(['source1', 'source2']);
        await preferences.removeAllFollowedSourceIds();
        expect(await preferences.getFollowedSourceIds(), equals([]));
      });
    });

    group('PreferencesStorageException - Followed Source IDs', () {
      test(
          'getFollowedSourceIds throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedSourceIds': 123});
        expect(
          () async => await preferences.getFollowedSourceIds(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'setFollowedSourceIds throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedSourceIds': 123});
        expect(
          () async => await preferences.setFollowedSourceIds(['source1', 'source2']),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'addFollowedSourceId throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedSourceIds': 123});
        expect(
          () async => await preferences.addFollowedSourceId('source1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'removeFollowedSourceId throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedSourceIds': ['source1']});
        expect(
          () async => await preferences.removeFollowedSourceId('source1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
      test(
        'removeAllFollowedSourceIds throws PreferencesStorageException on error',
        () async {
          final preferences =
              HtPreferencesInMemory.test({'followedSourceIds': 123});
          expect(
            () async => await preferences.removeAllFollowedSourceIds(),
            throwsA(isA<PreferencesStorageException>()),
          );
        },
      );
    });

    group('Followed Category IDs', () {
      test('getFollowedCategoryIds returns an empty list by default', () async {
        expect(await preferences.getFollowedCategoryIds(), equals([]));
      });

      test('setFollowedCategoryIds sets the list of followed category IDs',
          () async {
        final categoryIds = ['category1', 'category2'];
        await preferences.setFollowedCategoryIds(categoryIds);
        expect(await preferences.getFollowedCategoryIds(), equals(categoryIds));
      });

      test('addFollowedCategoryId adds a category ID to the list', () async {
        await preferences.addFollowedCategoryId('category1');
        expect(
          await preferences.getFollowedCategoryIds(),
          equals(['category1']),
        );

        // Test duplicate
        await preferences.addFollowedCategoryId('category1');
        expect(
          await preferences.getFollowedCategoryIds(),
          equals(['category1']),
        );
      });

      test(
          'removeFollowedCategoryId removes a category ID and throws if not found',
          () async {
        await preferences.addFollowedCategoryId('category1');
        await preferences.removeFollowedCategoryId('category1');
        expect(await preferences.getFollowedCategoryIds(), equals([]));

        expect(
          () async => preferences.removeFollowedCategoryId('category1'),
          throwsA(isA<CategoryNotFoundException>()),
        );
      });

      test('removeAllFollowedCategoryIds clears the list', () async {
        await preferences.setFollowedCategoryIds(['category1', 'category2']);
        await preferences.removeAllFollowedCategoryIds();
        expect(await preferences.getFollowedCategoryIds(), equals([]));
      });
    });

    group('PreferencesStorageException - Followed Category IDs', () {
      test(
          'getFollowedCategoryIds throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedCategoryIds': 123});
        expect(
          () async => preferences.getFollowedCategoryIds(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'setFollowedCategoryIds throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedCategoryIds': 123});
        expect(
          () async =>
              preferences.setFollowedCategoryIds(['category1', 'category2']),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'addFollowedCategoryId throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedCategoryIds': 123});
        expect(
          () async => preferences.addFollowedCategoryId('category1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'removeFollowedCategoryId throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({
          'followedCategoryIds': ['category1']
        });
        expect(
          () async => preferences.removeFollowedCategoryId('category1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
        'removeAllFollowedCategoryIds throws PreferencesStorageException on error',
        () async {
          final preferences =
              HtPreferencesInMemory.test({'followedCategoryIds': 123});
          expect(
            () async => preferences.removeAllFollowedCategoryIds(),
            throwsA(isA<PreferencesStorageException>()),
          );
        },
      );
    });

    group('Followed Event Country IDs', () {
      test('getFollowedEventCountryIds returns an empty list by default',
          () async {
        expect(await preferences.getFollowedEventCountryIds(), equals([]));
      });

      test('setFollowedEventCountryIds sets the list of followed country IDs',
          () async {
        final countryIds = ['country1', 'country2'];
        await preferences.setFollowedEventCountryIds(countryIds);
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(countryIds),
        );
      });

      test('addFollowedEventCountryId adds a country ID to the list', () async {
        await preferences.addFollowedEventCountryId('country1');
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(['country1']),
        );

        // Test duplicate
        await preferences.addFollowedEventCountryId('country1');
        expect(
          await preferences.getFollowedEventCountryIds(),
          equals(['country1']),
        );
      });

      test(
          'removeFollowedEventCountryId removes a country ID and throws if not found',
          () async {
        await preferences.addFollowedEventCountryId('country1');
        await preferences.removeFollowedEventCountryId('country1');
        expect(await preferences.getFollowedEventCountryIds(), equals([]));

        expect(
          () async => preferences.removeFollowedEventCountryId('country1'),
          throwsA(isA<CountryNotFoundException>()),
        );
      });

      test('removeAllFollowedEventCountryIds clears the list', () async {
        await preferences.setFollowedEventCountryIds(['country1', 'country2']);
        await preferences.removeAllFollowedEventCountryIds();
        expect(await preferences.getFollowedEventCountryIds(), equals([]));
      });
    });

    group('PreferencesStorageException - Followed Event Country IDs', () {
      test(
          'getFollowedEventCountryIds throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedEventCountryIds': 123});
        expect(
          () async => preferences.getFollowedEventCountryIds(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'setFollowedEventCountryIds throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedEventCountryIds': 123});
        expect(
          () async => preferences
              .setFollowedEventCountryIds(['country1', 'country2']),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'addFollowedEventCountryId throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'followedEventCountryIds': 123});
        expect(
          () async => preferences.addFollowedEventCountryId('country1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'removeFollowedEventCountryId throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({
          'followedEventCountryIds': ['country1']
        });
        expect(
          () async => preferences.removeFollowedEventCountryId('country1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
        'removeAllFollowedEventCountryIds throws PreferencesStorageException on error',
        () async {
          final preferences =
              HtPreferencesInMemory.test({'followedEventCountryIds': 123});
          expect(
            () async => preferences.removeAllFollowedEventCountryIds(),
            throwsA(isA<PreferencesStorageException>()),
          );
        },
      );
    });

    group('Headline Article Text Size', () {
      test('getHeadlineArticleTextSize returns the default value', () async {
        expect(
          await preferences.getHeadlineArticleTextSize(),
          equals(HeadlineArticleTextSize.medium),
        );
      });

      test('setHeadlineArticleTextSize sets the text size', () async {
        await preferences.setHeadlineArticleTextSize(
          HeadlineArticleTextSize.small,
        );
        expect(
          await preferences.getHeadlineArticleTextSize(),
          equals(HeadlineArticleTextSize.small),
        );

        await preferences.setHeadlineArticleTextSize(
          HeadlineArticleTextSize.large,
        );
        expect(
          await preferences.getHeadlineArticleTextSize(),
          equals(HeadlineArticleTextSize.large),
        );
      });
    });

    group('PreferencesStorageException - Headline Article Text Size', () {
      test(
          'getHeadlineArticleTextSize throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'headlineArticleTextSize': 123});
        expect(
          () async => preferences.getHeadlineArticleTextSize(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'setHeadlineArticleTextSize throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'headlineArticleTextSize': 123});
        expect(
          () async => preferences
              .setHeadlineArticleTextSize(HeadlineArticleTextSize.small),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
    });

    group('App Font Size', () {
      test('getAppFontSize returns the default value', () async {
        expect(await preferences.getAppFontSize(), equals(AppFontSize.medium));
      });

      test('setAppFontSize sets the font size', () async {
        await preferences.setAppFontSize(AppFontSize.small);
        expect(await preferences.getAppFontSize(), equals(AppFontSize.small));

        await preferences.setAppFontSize(AppFontSize.large);
        expect(await preferences.getAppFontSize(), equals(AppFontSize.large));
      });
    });

    group('PreferencesStorageException - App Font Size', () {
      test('getAppFontSize throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({'appFontSize': 123});
        expect(
          () async => preferences.getAppFontSize(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test('setAppFontSize throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({'appFontSize': 123});
        expect(
          () async => preferences.setAppFontSize(AppFontSize.small),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
    });

    group('Saved Headlines', () {
      test('getSavedHeadlines returns an empty list by default', () async {
        expect(await preferences.getSavedHeadlines(), equals([]));
      });

      test('setSavedHeadlines sets the list of saved headlines', () async {
        final headlines = ['headline1', 'headline2'];
        await preferences.setSavedHeadlines(headlines);
        expect(await preferences.getSavedHeadlines(), equals(headlines));
      });

      test('addSavedHeadline adds a headline to the list', () async {
        await preferences.addSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), equals(['headline1']));

        // Test duplicate
        await preferences.addSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), equals(['headline1']));
      });

      test('removeSavedHeadline removes a headline and throws if not found',
          () async {
        await preferences.addSavedHeadline('headline1');
        await preferences.removeSavedHeadline('headline1');
        expect(await preferences.getSavedHeadlines(), equals([]));

        expect(
          () async => preferences.removeSavedHeadline('headline1'),
          throwsA(isA<HeadlineNotFoundException>()),
        );
      });

      test('removeAllSavedHeadlines clears the list', () async {
        await preferences.setSavedHeadlines(['headline1', 'headline2']);
        await preferences.removeAllSavedHeadlines();
        expect(await preferences.getSavedHeadlines(), equals([]));
      });
    });

    group('PreferencesStorageException - Saved Headlines', () {
      test('getSavedHeadlines throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({'savedHeadlines': 123});
        expect(
          () async => preferences.getSavedHeadlines(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test('setSavedHeadlines throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({'savedHeadlines': 123});
        expect(
          () async => preferences.setSavedHeadlines(['headline1', 'headline2']),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test('addSavedHeadline throws PreferencesStorageException on error',
          () async {
        final preferences = HtPreferencesInMemory.test({'savedHeadlines': 123});
        expect(
          () async => preferences.addSavedHeadline('headline1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'removeSavedHeadline throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'savedHeadlines': ['headline1']});
        expect(
          () async => preferences.removeSavedHeadline('headline1'),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
        'removeAllSavedHeadlines throws PreferencesStorageException on error',
        () async {
          final preferences =
              HtPreferencesInMemory.test({'savedHeadlines': 123});
          expect(
            () async => preferences.removeAllSavedHeadlines(),
            throwsA(isA<PreferencesStorageException>()),
          );
        },
      );
    });

    group('Content Density', () {
      test('getContentDensity returns the default value', () async {
        expect(
          await preferences.getContentDensity(),
          equals(ContentDensity.comfortable),
        );
      });

      test('setContentDensity sets the content density', () async {
        await preferences.setContentDensity(ContentDensity.compact);
        expect(
          await preferences.getContentDensity(),
          equals(ContentDensity.compact),
        );
      });
    });

    group('PreferencesStorageException - Content Density', () {
      test('getContentDensity throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'contentDensity': 123});
        expect(
          () async => preferences.getContentDensity(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'setContentDensity throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'contentDensity': 123});
        expect(
          () async => preferences.setContentDensity(ContentDensity.compact),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
    });

    group('Feed Tile Layout', () {
      test('getFeedTileLayout returns the default value', () async {
        expect(
          await preferences.getFeedTileLayout(),
          equals(FeedTileLayout.imageStart),
        );
      });

      test('setFeedTileLayout sets the tile layout', () async {
        await preferences.setFeedTileLayout(FeedTileLayout.imageTop);
        expect(
          await preferences.getFeedTileLayout(),
          equals(FeedTileLayout.imageTop),
        );
      });
    });

    group('PreferencesStorageException - Feed Tile Layout', () {
      test('getFeedTileLayout throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'feedTileLayout': 123});
        expect(
          () async => preferences.getFeedTileLayout(),
          throwsA(isA<PreferencesStorageException>()),
        );
      });

      test(
          'setFeedTileLayout throws PreferencesStorageException on error',
          () async {
        final preferences =
            HtPreferencesInMemory.test({'feedTileLayout': 123});
        expect(
          () async => preferences.setFeedTileLayout(FeedTileLayout.imageTop),
          throwsA(isA<PreferencesStorageException>()),
        );
      });
    });
  });
}
