import 'package:app_data/src/data/quote/data_sources/apis.dart';
import 'package:app_data/src/data/quote/data_sources/quotes_remote_data_source.dart';
import 'package:app_data/src/data/quote/models/quote_model.dart';
import 'package:app_data/src/services/http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../mocks/mocks.mocks.dart';

final quotesPageJson = {
  'count': 1,
  'totalCount': 1,
  'page': 1,
  'totalPages': 1,
  'lastItemIndex': 1,
  'results': [
    {
      '_id': '1',
      'author': 'author_1',
      'content': 'content_1',
    },
  ]
};

const quotes = [
  QuoteModel(id: '1', author: 'author_1', content: 'content_1'),
];

void main() {
  late MockHttpService mockHttpService;
  late QuotesRemoteDataSource quotesRemoteDataSource;

  setUp(() {
    mockHttpService = MockHttpService();
    quotesRemoteDataSource = QuotesRemoteDataSource(mockHttpService);
  });

  group(
    'Fetch Quotes',
    () {
      test(
        'Return List of Quotes',
        () async {
          when(mockHttpService.requestPage(any))
              .thenAnswer((_) async => ServerPageResponse.fromJson(quotesPageJson));

          final fetchedQuotes = await quotesRemoteDataSource.fetchQuotes(page: 1);

          verify(mockHttpService.requestPage(QuotesApis.quotes)).called(1);

          expect(
            fetchedQuotes.items,
            quotes,
          );
        },
      );

      test(
        'throws a ServerException on server error',
        () {
          when(mockHttpService.requestPage(any)) //
              .thenThrow(const BadRequestException(ServerError()));

          expect(
            () => quotesRemoteDataSource.fetchQuotes(page: 1),
            throwsA(const BadRequestException(ServerError())),
          );
        },
      );
    },
  );
}
