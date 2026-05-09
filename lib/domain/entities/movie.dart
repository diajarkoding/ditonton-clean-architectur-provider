import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  Movie({
    this.adult = false,
    this.backdropPath,
    this.genreIds = const [],
    required this.id,
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0.0,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video = false,
    this.voteAverage = 0.0,
    this.voteCount = 0,
  });

  Movie.watchlist({
    required this.id,
    this.overview,
    this.posterPath,
    this.title,
  });

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalTitle;
  final String? overview;
  final double popularity;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
