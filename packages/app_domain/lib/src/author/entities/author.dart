class Author {
  Author({
    required this.id,
    required this.bio,
    required this.description,
    required this.link,
    required this.name,
    required this.slug,
    required this.quoteCount,
  });

  /// A unique id for this author
  final String id;

  /// A brief, one paragraph bio of the author. Source: wiki API
  final String bio;

  /// A one-line description of the author. Typically it is the person's primary
  /// occupation or what they are know for.
  final String description;

  /// The link to the author's wikipedia page or official website
  final String link;

  /// The authors full name
  final String name;

  /// A slug is a URL-friendly ID derived from the authors name. It can be used as
  final String slug;

  /// The number of quotes by this author
  final int quoteCount;
}
