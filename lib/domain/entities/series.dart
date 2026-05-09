import 'package:equatable/equatable.dart';

class Series extends Equatable {
  final bool? adult;
  final String? backdropPath;
  final String? firstAirDate;
  final List<int>? genreIds;
  final int? id;
  final String? name;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalName;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final double? voteAverage;
  final int? voteCount;
  final String? mediaType;

  Series({
    this.adult,
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.mediaType,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  Series.watchlist({
    required this.id,
    this.overview,
    this.posterPath,
    this.name,
  })  : adult = null,
        backdropPath = null,
        firstAirDate = null,
        genreIds = null,
        mediaType = null,
        originCountry = null,
        originalLanguage = null,
        originalName = null,
        popularity = null,
        voteAverage = null,
        voteCount = null;

  @override
  List<Object?> get props => [
        adult, backdropPath, firstAirDate, genreIds, id,
        mediaType, name, originCountry, originalLanguage,
        originalName, overview, popularity, posterPath,
        voteAverage, voteCount,
      ];
}
