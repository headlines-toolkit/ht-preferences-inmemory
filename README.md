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
flutter pub get
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
print(language); // Output: en

// Set theme
await preferencesClient.setTheme(ThemeMode.dark);

// Add favorite source
await preferencesClient.addFavoriteSource('bbc_news');
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

  // Add and get favorite news sources.
  await preferencesClient.addFavoriteSource('cnn');
  await preferencesClient.addFavoriteSource('bbc');
  final favoriteSources = await preferencesClient.getFavoriteSources();
  print('Favorite Sources: $favoriteSources');

  // Remove a favorite news source.
  await preferencesClient.removeFavoriteSource('cnn');
  final updatedFavoriteSources = await preferencesClient.getFavoriteSources();
  print('Updated Favorite Sources: $updatedFavoriteSources');
    // Add and get favorite news categories.
  await preferencesClient.addFavoriteCategory('business');
  await preferencesClient.addFavoriteCategory('technology');
  final favoriteCategories = await preferencesClient.getFavoriteCategories();
  print('Favorite Categories: $favoriteCategories');

  // Remove a favorite news category.
  await preferencesClient.removeFavoriteCategory('business');
  final updatedFavoriteCategories = await preferencesClient.getFavoriteCategories();
  print('Updated Favorite Categories: $updatedFavoriteCategories');

  // Add and get favorite event countries.
  await preferencesClient.addFavoriteEventCountry('us');
  await preferencesClient.addFavoriteEventCountry('uk');
  final favoriteCountries = await preferencesClient.getFavoriteEventCountries();
  print('Favorite Countries: $favoriteCountries');

  // Remove a favorite event country.
  await preferencesClient.removeFavoriteEventCountry('us');
  final updatedFavoriteCountries = await preferencesClient.getFavoriteEventCountries();
  print('Updated Favorite Countries: $updatedFavoriteCountries');
}

```

