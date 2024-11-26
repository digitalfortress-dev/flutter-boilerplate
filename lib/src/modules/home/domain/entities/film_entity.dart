class FilmEntity {
  final int malId;
  final String url;
  final String imageUrl; // Represents the primary image URL
  final String? youtubeId; // Represents the YouTube trailer ID
  final bool approved;
  final String title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String> titleSynonyms;
  final String type;
  final String status;
  final String? synopsis;
  final String? background;
  final String? season;
  final int? year;
  final BroadcastEntity? broadcast;
  final List<ProducerEntity> producers;
  final List<ProducerEntity> licensors;
  final List<ProducerEntity> studios;
  final List<GenreEntity> genres;
  final List<GenreEntity> explicitGenres;
  final List<GenreEntity> themes;
  final List<GenreEntity> demographics;

  FilmEntity({
    required this.malId,
    required this.url,
    required this.imageUrl,
    this.youtubeId,
    required this.approved,
    required this.title,
    this.titleEnglish,
    this.titleJapanese,
    required this.titleSynonyms,
    required this.type,
    required this.status,
    this.synopsis,
    this.background,
    this.season,
    this.year,
    this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.explicitGenres,
    required this.themes,
    required this.demographics,
  });
}

class BroadcastEntity {
  final String? day;
  final String? time;
  final String? timezone;
  final String? string; // e.g., "Fridays at 23:00 (JST)"

  BroadcastEntity({
    this.day,
    this.time,
    this.timezone,
    this.string,
  });
}

class ProducerEntity {
  final int malId;
  final String type; // e.g., "anime"
  final String name; // e.g., "Madhouse"
  final String
      url; // e.g., "https://myanimelist.net/anime/producer/11/Madhouse"

  ProducerEntity({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });
}

class GenreEntity {
  final int malId;
  final String type; // e.g., "anime"
  final String name; // e.g., "Adventure"
  final String url; // e.g., "https://myanimelist.net/anime/genre/2/Adventure"

  GenreEntity({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });
}
