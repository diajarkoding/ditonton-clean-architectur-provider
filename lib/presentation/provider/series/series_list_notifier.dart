import 'package:ditonton/domain/entities/series.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/series/get_now_playing_series.dart';
import 'package:ditonton/domain/usecases/series/get_popular_series.dart';
import 'package:ditonton/domain/usecases/series/get_series_recommendations.dart';
import 'package:ditonton/domain/usecases/series/get_top_rated_series.dart';
import 'package:flutter/material.dart';

class SeriesListNotifier extends ChangeNotifier {
  var _nowPlayingSeries = <Series>[];
  List<Series> get nowPlayingSeries => _nowPlayingSeries;

  RequestState _nowPlayingState = RequestState.empty;
  RequestState get nowPlayingState => _nowPlayingState;

  var _popularSeries = <Series>[];
  List<Series> get popularSeries => _popularSeries;

  RequestState _popularSeriesState = RequestState.empty;
  RequestState get popularSeriesState => _popularSeriesState;

  var _topRatedSeries = <Series>[];
  List<Series> get topRatedSeries => _topRatedSeries;

  RequestState _topRatedSeriesState = RequestState.empty;
  RequestState get topRatedSeriesState => _topRatedSeriesState;

  List<Series> _seriesRecommendations = [];
  List<Series> get seriesRecommendations => _seriesRecommendations;

  RequestState _recommendationState = RequestState.empty;
  RequestState get recommendationState => _recommendationState;

  String _message = '';
  String get message => _message;

  SeriesListNotifier({
    required this.getNowPlayingSeries,
    required this.getPopularSeries,
    required this.getTopRatedSeries,
    required this.getSeriesRecommendations,
  });

  final GetNowPlayingSeries getNowPlayingSeries;
  final GetPopularSeries getPopularSeries;
  final GetTopRatedSeries getTopRatedSeries;
  final GetSeriesRecommendations getSeriesRecommendations;

  Future<void> fetchNowPlayingSeries() async {
    _nowPlayingState = RequestState.loading;
    notifyListeners();

    final result = await getNowPlayingSeries.execute();
    result.fold(
      (failure) {
        _nowPlayingState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (seriesData) {
        _nowPlayingState = RequestState.loaded;
        _nowPlayingSeries = seriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchPopularSeries() async {
    _popularSeriesState = RequestState.loading;
    notifyListeners();

    final result = await getPopularSeries.execute();
    result.fold(
      (failure) {
        _popularSeriesState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (seriesData) {
        _popularSeriesState = RequestState.loaded;
        _popularSeries = seriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetchTopRatedSeries() async {
    _topRatedSeriesState = RequestState.loading;
    notifyListeners();

    final result = await getTopRatedSeries.execute();
    result.fold(
      (failure) {
        _topRatedSeriesState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (seriesData) {
        _topRatedSeriesState = RequestState.loaded;
        _topRatedSeries = seriesData;
        notifyListeners();
      },
    );
  }

  Future<void> fetctSeriesRecommendations(int id) async {
    _recommendationState = RequestState.loading;
    notifyListeners();

    final result = await getSeriesRecommendations.execute(id);
    result.fold(
      (failure) {
        _recommendationState = RequestState.error;
        _message = failure.message;
        notifyListeners();
      },
      (seriesData) {
        _recommendationState = RequestState.loaded;
        _seriesRecommendations = seriesData;
        notifyListeners();
      },
    );
  }
}
