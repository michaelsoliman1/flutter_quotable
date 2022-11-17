# Awesome Quotes

The app is the starting point to learn the best practices to follow while writing flutter apps.

it follows the architecture purposed in this [presentation](https://drive.google.com/file/d/1odHgt_8XNGfnPeHkcrGeMNfkk1iuPV44/view) and it will focuse on:

- App Architecture
- Folder Structure
- Writing clean and reusable code

## Refactor Roadmap

- [x] use [very_good_analysis](https://pub.dev/packages/very_good_analysis) for lints as a start
- [x] use go_router for routing
- [x] migrate to riverpod (instead of provider)
- [x] refactor app with simple domain-oriented architecture `(presentation/application/domain/data)`
  - [x] package domain layer
  - [x] package data layer
- [x] package shared ui code
- [x] setup melos (for managing packages)

<br>

## TODOs

### Core

- [ ] use `Either` to improve error catching

### Presentation layer

- [ ] add pagination

### Data layer

- [ ] use `injectable` to manage dependencies

<br>

## App Architecture

<br>

This app demo was initially made for GDSC flutter workshop, Cairo University to demonstrate how to use of http and local storage in flutter.
