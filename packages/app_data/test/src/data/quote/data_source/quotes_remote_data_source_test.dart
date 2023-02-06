import 'package:app_data/src/data/quote/data_sources/apis.dart';
import 'package:app_data/src/data/quote/data_sources/quotes_remote_data_source.dart';
import 'package:app_data/src/data/quote/models/quote_model.dart';
import 'package:app_data/src/services/http/http.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'quotes_remote_data_source_test.mocks.dart';

final quotesJson = {
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

@GenerateMocks([HttpService])
void main() {
  late MockHttpService mockHttpService;
  late QuotesRemoteDataSource sot;

  setUp(() {
    mockHttpService = MockHttpService();
    sot = QuotesRemoteDataSource(mockHttpService);
  });

  group(
    'Quotes Remote Data Source',
    () {
      test(
        'Return List of Quotes',
        () async {
          when(mockHttpService.requestPage(QuotesApis.quotes))
              .thenAnswer((_) async => ServerPageResponse.fromJson(quotesJson));

          final fetchedQuotes = await sot.fetchQuotes(page: 1);

          verify(mockHttpService.requestPage(QuotesApis.quotes)).called(1);

          expect(
            fetchedQuotes.items,
            quotes,
          );
        },
      );
    },
  );
}
