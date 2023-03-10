import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/entities/series.dart';
import 'package:ditonton/domain/usecases/series/get_popular_series.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/series/series_test_helper.mocks.dart';

void main() {
  late GetPopularSeries usecase;
  late MockSeriesRepository mockSeriesRepository;

  setUp(() {
    mockSeriesRepository = MockSeriesRepository();
    usecase = GetPopularSeries(mockSeriesRepository);
  });

  final tSeries = <Series>[];

  group('GetPopularSeries Tests', () {
    group('execute', () {
      test(
          'should get list of Series from the repository when execute function is called',
          () async {
        // arrange
        when(mockSeriesRepository.getPopularSeries())
            .thenAnswer((_) async => Right(tSeries));
        // act
        final result = await usecase.execute();
        // assert
        expect(result, Right(tSeries));
      });
    });
  });
}
