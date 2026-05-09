import 'dart:convert';
import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/models/series/series_detail_model.dart';
import 'package:ditonton/data/models/series/series_model.dart';
import 'package:ditonton/data/models/series/series_response.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class SeriesRemoteDataSource {
  Future<List<SeriesModel>> getNowPlayingSeries();
  Future<List<SeriesModel>> getPopularSeries();
  Future<List<SeriesModel>> getTopRatedSeries();
  Future<SeriesDetailModel> getSeriesDetail(int id);
  Future<List<SeriesModel>> getSeriesRecommendations(int id);
  Future<List<SeriesModel>> searchSeries(String query);
}

class SeriesRemoteDataSourceImpl implements SeriesRemoteDataSource {
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  final http.Client client;

  SeriesRemoteDataSourceImpl({required this.client});

  String get _apiKey => 'api_key=${dotenv.env['TMDB_API_KEY'] ?? ''}';

  @override
  Future<List<SeriesModel>> getNowPlayingSeries() async {
    final response =
        await client.get(Uri.parse('$_baseUrl/tv/on_the_air?$_apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SeriesDetailModel> getSeriesDetail(int id) async {
    final response = await client.get(Uri.parse('$_baseUrl/tv/$id?$_apiKey'));

    if (response.statusCode == 200) {
      return SeriesDetailModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SeriesModel>> getSeriesRecommendations(int id) async {
    final response = await client
        .get(Uri.parse('$_baseUrl/tv/$id/recommendations?$_apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SeriesModel>> getPopularSeries() async {
    final response =
        await client.get(Uri.parse('$_baseUrl/tv/popular?$_apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SeriesModel>> getTopRatedSeries() async {
    final response =
        await client.get(Uri.parse('$_baseUrl/tv/top_rated?$_apiKey'));

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SeriesModel>> searchSeries(String query) async {
    final response = await client.get(
      Uri.parse('$_baseUrl/search/tv?$_apiKey&query=${Uri.encodeQueryComponent(query)}'),
    );

    if (response.statusCode == 200) {
      return SeriesResponse.fromJson(json.decode(response.body)).seriesList;
    } else {
      throw ServerException();
    }
  }
}
