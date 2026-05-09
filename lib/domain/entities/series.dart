import 'package:equatable/equatable.dart';

class Series extends Equatable {
  Series({
    this.adult = false,
    this.backdropPath,
    this.firstAirDate,
    this.genreIds = const [],
    required this.id,
    this.mediaType,
    this.name,
    this.originCountry = const [],
    this.originalLanguage = '',
    this.originalName = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  Series.watchlist({
    required this.id,
    this.overview,
    this.posterPath,
    this.name,
  });

  final bool adult;
  final String? backdropPath;
  final String? firstAirDate;
  final List<int> genreIds;
  final int id;
  final String? name;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalName;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final double voteAverage;
  final int voteCount;
  final String? mediaType;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        firstAirDate,
        genreIds,
        id,
        mediaType,
        name,
        originCountry,
        originalLanguage,
        originalName,
        overview,
        popularity,
        posterPath,
        voteAverage,
        voteCount,
      ];
}
