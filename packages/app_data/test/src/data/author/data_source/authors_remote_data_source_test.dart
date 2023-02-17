import 'package:app_data/src/data/author/data_sources/apis.dart';
import 'package:app_data/src/data/author/data_sources/authors_remote_data_source.dart';
import 'package:app_data/src/data/author/models/author_model.dart';
import 'package:app_data/src/services/http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../mocks/mocks.mocks.dart';

final authorsPageJson = {
  'count': 1,
  'totalCount': 1,
  'page': 1,
  'totalPages': 1,
  'lastItemIndex': 1,
  'results': [
    {
      '_id': '1',
      'bio': 'bio',
      'description': 'description',
      'link': 'link',
      'name': 'name',
      'slug': 'slug',
      'quoteCount': 1,
    },
  ]
};

const authors = [
  AuthorModel(
    id: '1',
    bio: 'bio',
    description: 'description',
    link: 'link',
    name: 'name',
    slug: 'slug',
    quoteCount: 1,
  ),
];

void main() {
  late MockHttpService mockHttpService;
  late AuthorsRemoteDataSource authorsRemoteDataSource;

  setUp(() {
    mockHttpService = MockHttpService();
    authorsRemoteDataSource = AuthorsRemoteDataSource(mockHttpService);
  });

  group(
    'Fetch Authors',
    () {
      test(
        'Return List of Authors',
        () async {
          when(mockHttpService.requestPage(any))
              .thenAnswer((_) async => ServerPageResponse.fromJson(authorsPageJson));

          final fetchedAuthors = await authorsRemoteDataSource.fetchAuthors(page: 1);

          verify(mockHttpService.requestPage(AuthorsApis.authors)).called(1);

          expect(
            fetchedAuthors.items,
            authors,
          );
        },
      );

      test(
        'throws a ServerException on server error',
        () {
          when(mockHttpService.requestPage(any)) //
              .thenThrow(const BadRequestException(ServerError()));

          expect(
            () => authorsRemoteDataSource.fetchAuthors(page: 1),
            throwsA(const BadRequestException(ServerError())),
          );
        },
      );
    },
  );
}
