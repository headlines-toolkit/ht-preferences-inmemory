# ht_preferences_inmemory

Inmemory implementation of the `HtPreferencesClient` interface. It's primarily intended for development purposes.

## Installation

Add `ht_preferences_inmemory` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  ht_preferences_inmemory:
    git:
      url: https://github.com/headlines-toolkit/ht-preferences-inmemory.git
      ref: main 
```

Then, run:

```bash
dart pub get
```

## Usage

Import the package:

```dart
import 'package:ht_preferences_inmemory/ht_preferences_inmemory.dart';
```

Create an instance of `HtPreferencesInMemory`:

```dart
final preferencesClient = HtPreferencesInMemory();
```

Use the methods to manage preferences:

```dart
// Set language
await preferencesClient.setLanguage('en');

// Get language
final language = await preferencesClient.getLanguage();
print(language);

// Set theme
await preferencesClient.setTheme(ThemeMode.dark);

// Add followed source ID
await preferencesClient.addFollowedSourceId('bbc_news');
```

## Example

```dart
import 'package:ht_preferences_client/ht_preferences_client.dart';
import 'package:ht_preferences_inmemory/ht_preferences_inmemory.dart';

void main() async {
  final preferencesClient = HtPreferencesInMemory();

  // Set and get the user's preferred language.
  await preferencesClient.setLanguage('es');
  final language = await preferencesClient.getLanguage();
  print('Preferred Language: $language');

  // Set and get the user's preferred theme.
  await preferencesClient.setTheme(ThemeMode.dark);
  final theme = await preferencesClient.getTheme();
  print('Preferred Theme: $theme');

  // Add and get followed source IDs.
  await preferencesClient.addFollowedSourceId('cnn');
  await preferencesClient.addFollowedSourceId('bbc');
  final followedSources = await preferencesClient.getFollowedSourceIds();
  print('Followed Sources: $followedSources');

  // Remove a followed source ID.
  await preferencesClient.removeFollowedSourceId('cnn');
  final updatedFollowedSources = await preferencesClient.getFollowedSourceIds();
  print('Updated Followed Sources: $updatedFollowedSources');

  // Add and get followed category IDs.
  await preferencesClient.addFollowedCategoryId('business');
  await preferencesClient.addFollowedCategoryId('technology');
  final followedCategories = await preferencesClient.getFollowedCategoryIds();
  print('Followed Categories: $followedCategories');

  // Remove a followed category ID.
  await preferencesClient.removeFollowedCategoryId('business');
  final updatedFollowedCategories =
      await preferencesClient.getFollowedCategoryIds();
  print('Updated Followed Categories: $updatedFollowedCategories');

  // Add and get followed event country IDs.
  await preferencesClient.addFollowedEventCountryId('us');
  await preferencesClient.addFollowedEventCountryId('uk');
  final followedCountries = await preferencesClient.getFollowedEventCountryIds();
  print('Followed Countries: $followedCountries');

  // Remove a followed event country ID.
  await preferencesClient.removeFollowedEventCountryId('us');
  final updatedFollowedCountries =
      await preferencesClient.getFollowedEventCountryIds();
  print('Updated Followed Countries: $updatedFollowedCountries');

  // Set and get headline article text size
  await preferencesClient.setHeadlineArticleTextSize(
    HeadlineArticleTextSize.large,
  );
  final headlineArticleTextSize =
      await preferencesClient.getHeadlineArticleTextSize();
  print('Headline Article Text Size: $headlineArticleTextSize');

  // Set and get app font size
  await preferencesClient.setAppFontSize(AppFontSize.large);
  final appFontSize = await preferencesClient.getAppFontSize();
  print('App Font Size: $appFontSize');

  // Add and get saved headlines
  await preferencesClient.addSavedHeadline('headline1');
  await preferencesClient.addSavedHeadline('headline2');
  final savedHeadlines = await preferencesClient.getSavedHeadlines();
  print('Saved Headlines: $savedHeadlines');

  // Remove a saved headline
  await preferencesClient.removeSavedHeadline('headline1');
  final updatedSavedHeadlines = await preferencesClient.getSavedHeadlines();
  print('Updated Saved Headlines: $updatedSavedHeadlines');

  // Set and get content density
  await preferencesClient.setContentDensity(ContentDensity.compact);
  final contentDensity = await preferencesClient.getContentDensity();
  print('Content Density: $contentDensity');

  // Set and get feed tile layout
  await preferencesClient.setFeedTileLayout(FeedTileLayout.imageTop);
  final feedTileLayout = await preferencesClient.getFeedTileLayout();
  print('Feed Tile Layout: $feedTileLayout');

    // Remove all followed source IDs.
  await preferencesClient.removeAllFollowedSourceIds();
  final emptyFollowedSources = await preferencesClient.getFollowedSourceIds();
  print('Empty Followed Sources: $emptyFollowedSources');

  // Remove all followed category IDs.
  await preferencesClient.removeAllFollowedCategoryIds();
  final emptyFollowedCategories =
      await preferencesClient.getFollowedCategoryIds();
  print('Empty Followed Categories: $emptyFollowedCategories');

  // Remove all followed event country IDs.
  await preferencesClient.removeAllFollowedEventCountryIds();
  final emptyFollowedCountries =
      await preferencesClient.getFollowedEventCountryIds();
  print('Empty Followed Countries: $emptyFollowedCountries');

  // Remove all saved headlines
  await preferencesClient.removeAllSavedHeadlines();
  final emptySavedHeadlines = await preferencesClient.getSavedHeadlines();
  print('Empty Saved Headlines: $emptySavedHeadlines');
}
```

## Issues

Please file any issues, bugs, or feature requests at the [issue tracker](https://github.com/headlines-toolkit/ht-preferences-inmemory/issues).

## License

See the [LICENSE](LICENSE) file for details.
