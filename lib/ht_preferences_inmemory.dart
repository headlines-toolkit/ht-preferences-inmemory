/// Inmemory implementation of the `HtPreferencesClient` interface.
/// It's primarily intended for development purposes.
library;

// Re-export the necessary types from the ht_preferences_client interface.
export 'package:ht_preferences_client/ht_preferences_client.dart'
    show
        AppFontSize,
        CategoryNotFoundException,
        ContentDensity,
        CountryNotFoundException,
        FeedTileLayout,
        HeadlineArticleTextSize,
        HeadlineNotFoundException,
        HtPreferencesClient,
        InvalidLanguageException,
        PreferencesStorageException,
        SourceNotFoundException,
        ThemeMode;

export 'src/ht_preferences_inmemory.dart';
