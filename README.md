# Flutter Quotable

Flutter Quotable is an educational Flutter app built with Riverpod using a Domain Centric (and Packaged) Architecture as purposed in this [presentation](https://drive.google.com/file/d/1odHgt_8XNGfnPeHkcrGeMNfkk1iuPV44/view) that was originally made for [FlutterBytes Conference](https://twitter.com/flutterbyteconf).

it primarily focuses on:

- App Architecture (using a [Domain-Centric Architecture](https://jlasoc.medium.com/what-is-domain-centric-architecture-e030e609c401#:~:text=The%20term%20was%20coined%20by,in%20technical%20and%20business%20contexts.))
- App Folder Structure (using packages and [Melos](https://melos.invertase.dev/))

# Index
- [Quick Overview](#quick-overview)
- [Architecture](#architecture)
    - [Domain Layer](#domain-layer)
    - [Data Layer](#data-layer)
    - [Application Layer](#application-layer)
    - [Presentation Layer](#presentation-layer)
- [Dependency Management](#dependency-management)
    - [Overview](#dependency-management)
    - [Registering Dependencies](#registering-dependencies)
        
# Quick Overview
<img src="resources/architecture.png" width="350" title="architecture">
<img src="resources/folder_structure.png" width="350" title="architecture">

# Architecture



For the app architecture, we don't follow a specific approach like DDD or Clean Architecture, but we use a simplifed version with only **one important concept, that it's should be Domain Centric**. You can then implement your layers the way you consider best for your app usecase.


## Domain Layer
Our domain layer encapsulate all of our business logic, and it consists of
- Entities to write our domain model (you can also use ValueObjects, but we won't use it in our example)
- Repositories for our interface and usecases

which is enough to keep things organized and clean, and to avoid unnecessary complexity.

This layer consists of only dart code and does not depend on anything at all (maybe some core models). this ensures a good sepration of concerns and a clear Ubiquitous Language.

Example,

this is how we might write our quote entity, notice how we define its equailty by only the `id` field

```dart
class Quote extends Equatable {
  const Quote({
    required this.id,
    required this.author,
    required this.content,
  });

  final String id;
  final String content;
  final String author;

  @override
  List<Object?> get props => [id];
}
```
and this is our repository interface
```dart
abstract class QuotesRepository {
  Future<Either<Failure, Page<Quote>>> quotes({
    required int pageIndex,
    int limit = 20,
  });
}
```


## Data Layer
Consider the data layer as an implementation of our domain, by implementing the abstract `repositories` without exposing any details on how we do that. We might get our data from a server, Firebase, or even from local storage, the domain does not (nor any of the other layers) care about these details, it only deals with the interface defined in the domain layer, see [Dependency Management](#dependency-management) for how we manage that.

The data layer consists of
- Repositories Implementations of our domain
- Data Sources, which are used by repositories to communicate with, well, data sources (i.e server, firebase or local)
- Models, which are like [DTO](https://martinfowler.com/eaaCatalog/dataTransferObject.html)s that are responsible for mapping raw data (typically json) from/to our domain entities

Example

```dart
class QuotesRepositoryImpl with RepositoryMixin implements QuotesRepository {
  QuotesRepositoryImpl(this._remoteDataSource);

  final QuotesRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, Page<Quote>>> quotes({required int pageIndex, int limit = 20}) {
    // `request` is a helper method to map the data source response to match our interface
    return request(
      () => _remoteDataSource.fetchQuotes(pageIndex: pageIndex, limit: limit),
    );
  }
}
```

```dart
class QuotesRemoteDataSource {
  QuotesRemoteDataSource(this._httpService);

  final HttpService _httpService;

  Future<Page<QuoteModel>> fetchQuotes({required int pageIndex, int limit = 20}) async {
    final response = await _httpService.requestPage(
      QuotesApis.quotes,
      pageIndex: pageIndex,
      limit: limit,
    );
    return Page(
      totalCount: response.totalCount,
      pageIndex: response.pageIndex,
      totalPages: response.totalPages,
      items: response.results.map(QuoteModel.fromJson).toList(),
    );
  }
}
```

## Application Layer
## Presentation Layer
# Dependency Management
For managing our dependencies, we use a [service locator](https://en.wikipedia.org/wiki/Service_locator_pattern) (using [getit](https://pub.dev/packages/get_it))

We define our locator instance in the data layer, and inject it with all the repositories implementations of the domain (and any other services needed).
```dart
final locator = Locator();
```

Note that we expose only the locator instance from the data layer to be used across other layers (i.e application), this ensures that as we don't depend on any implementation details.

for example if we want to access our `QuotesRepository`, we can do so by just calling the locator with the desired interface, assuming we already registered it (see [Registering Dependencies](#registering-dependencies)). Also notice that we don't know anything about how that repository is implemented, and we shouldn't.
```dart
locator<QuotesRepository>();
```

### Registering Dependencies
For registering a dependency, we don't use `getit` directly (although we can), Instead we use [injectable](https://pub.dev/packages/injectable) (and the power of code generation) to save us the time and effort of manually doing that. 

We simply annonate the class we want to register with `@LazySingleton()` or `@Singleton()` and injectable takes care of everything else.

Example
```dart
@LazySingleton()
class QuotesRemoteDataSource {}
```

**note**: if you want to register an implementation to an interface, you must use `as` parameter and pass in the interface 
```dart
@LazySingleton(as: QuotesRepository)
class QuotesRepositoryImpl implements QuotesRepository {}
```
