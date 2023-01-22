# Flutter Quotable

Flutter Quotable is a flutter app based on [Quotable API](https://github.com/lukePeavey/quotable). It was originally built for a flutter workshop for [GDSC Cairo University.](https://www.facebook.com/DSCCUFE2021/)

This app follows the architecture purposed in this [presentation](https://drive.google.com/file/d/1odHgt_8XNGfnPeHkcrGeMNfkk1iuPV44/view) and it will focus on:

- App Architecture
- Folder Structure

<br>

# TODOs

### Data layer

- [ ] use `injectable` for registering dependencies

### Core

- [x] use `Either` to improve error handling
- [x] pagination support

<br>

# Refactor Roadmap

- [x] use [very_good_analysis](https://pub.dev/packages/very_good_analysis) for lints as a start
- [x] use [go_router](https://pub.dev/packages/go_router) for routing
- [x] migrate to [riverpod](https://riverpod.dev/) (instead of provider)
- [x] refactor app to use domain-oriented architecture `(presentation/application/domain/data)`
  - [x] refactor domain layer as a separate package
  - [x] refactor data layer as a separate package
- [x] refactor shared ui as a separate package
- [x] setup [melos](https://melos.invertase.dev/) (for managing packages)
