//
import 'package:ht_preferences_client/ht_preferences_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockHtPreferencesClient extends Mock implements HtPreferencesClient {}

void main() {
  group('PreferencesStorageException', () {
    late HtPreferencesClient preferences;

    setUp(() {
      preferences = MockHtPreferencesClient();
    });

    test('getLanguage throws PreferencesStorageException', () async {
      when(preferences.getLanguage).thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getLanguage(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setLanguage throws PreferencesStorageException', () async {
      when(() => preferences.setLanguage(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setLanguage('en'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getTheme throws PreferencesStorageException', () async {
      when(preferences.getTheme).thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getTheme(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setTheme throws PreferencesStorageException', () async {
      when(() => preferences.setTheme(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setTheme(ThemeMode.system),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFollowedSourceIds throws PreferencesStorageException', () async {
      when(preferences.getFollowedSourceIds)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getFollowedSourceIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFollowedSourceIds throws PreferencesStorageException', () async {
      when(() => preferences.setFollowedSourceIds(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setFollowedSourceIds([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addFollowedSourceId throws PreferencesStorageException', () async {
      when(() => preferences.addFollowedSourceId(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.addFollowedSourceId('source1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeFollowedSourceId throws PreferencesStorageException', () async {
      when(() => preferences.removeFollowedSourceId(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeFollowedSourceId('source1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFollowedCategoryIds throws PreferencesStorageException', () async {
      when(preferences.getFollowedCategoryIds)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getFollowedCategoryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFollowedCategoryIds throws PreferencesStorageException', () async {
      when(() => preferences.setFollowedCategoryIds(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setFollowedCategoryIds([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addFollowedCategoryId throws PreferencesStorageException', () async {
      when(() => preferences.addFollowedCategoryId(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.addFollowedCategoryId('category1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeFollowedCategoryId throws PreferencesStorageException',
        () async {
      when(() => preferences.removeFollowedCategoryId(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeFollowedCategoryId('category1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFollowedEventCountryIds throws PreferencesStorageException',
        () async {
      when(preferences.getFollowedEventCountryIds)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getFollowedEventCountryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFollowedEventCountryIds throws PreferencesStorageException',
        () async {
      when(() => preferences.setFollowedEventCountryIds(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setFollowedEventCountryIds([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addFollowedEventCountryId throws PreferencesStorageException',
        () async {
      when(() => preferences.addFollowedEventCountryId(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.addFollowedEventCountryId('country1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeFollowedEventCountryId throws PreferencesStorageException',
        () async {
      when(() => preferences.removeFollowedEventCountryId(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeFollowedEventCountryId('country1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllFollowedSourceIds throws PreferencesStorageException',
        () async {
      when(preferences.removeAllFollowedSourceIds)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeAllFollowedSourceIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllFollowedCategoryIds throws PreferencesStorageException',
        () async {
      when(preferences.removeAllFollowedCategoryIds)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeAllFollowedCategoryIds(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test(
      'removeAllFollowedEventCountryIds throws PreferencesStorageException',
      () async {
        when(preferences.removeAllFollowedEventCountryIds)
            .thenThrow(PreferencesStorageException());
        expect(
          () async => preferences.removeAllFollowedEventCountryIds(),
          throwsA(isA<PreferencesStorageException>()),
        );
      },
    );

    test('getHeadlineArticleTextSize throws PreferencesStorageException',
        () async {
      when(preferences.getHeadlineArticleTextSize)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getHeadlineArticleTextSize(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setHeadlineArticleTextSize throws PreferencesStorageException',
        () async {
      when(() => preferences.setHeadlineArticleTextSize(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences
            .setHeadlineArticleTextSize(HeadlineArticleTextSize.medium),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getAppFontSize throws PreferencesStorageException', () async {
      when(preferences.getAppFontSize).thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getAppFontSize(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setAppFontSize throws PreferencesStorageException', () async {
      when(() => preferences.setAppFontSize(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setAppFontSize(AppFontSize.medium),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getSavedHeadlines throws PreferencesStorageException', () async {
      when(preferences.getSavedHeadlines)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getSavedHeadlines(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setSavedHeadlines throws PreferencesStorageException', () async {
      when(() => preferences.setSavedHeadlines(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setSavedHeadlines([]),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('addSavedHeadline throws PreferencesStorageException', () async {
      when(() => preferences.addSavedHeadline(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.addSavedHeadline('headline1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeSavedHeadline throws PreferencesStorageException', () async {
      when(() => preferences.removeSavedHeadline(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeSavedHeadline('headline1'),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('removeAllSavedHeadlines throws PreferencesStorageException',
        () async {
      when(preferences.removeAllSavedHeadlines)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.removeAllSavedHeadlines(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getContentDensity throws PreferencesStorageException', () async {
      when(preferences.getContentDensity)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getContentDensity(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setContentDensity throws PreferencesStorageException', () async {
      when(() => preferences.setContentDensity(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setContentDensity(ContentDensity.comfortable),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('getFeedTileLayout throws PreferencesStorageException', () async {
      when(preferences.getFeedTileLayout)
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.getFeedTileLayout(),
        throwsA(isA<PreferencesStorageException>()),
      );
    });

    test('setFeedTileLayout throws PreferencesStorageException', () async {
      when(() => preferences.setFeedTileLayout(any()))
          .thenThrow(PreferencesStorageException());
      expect(
        () async => preferences.setFeedTileLayout(FeedTileLayout.imageStart),
        throwsA(isA<PreferencesStorageException>()),
      );
    });
  });
}
