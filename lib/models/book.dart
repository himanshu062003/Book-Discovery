
class Book {
  final int id;
  final String title;
  final List<Author> authors;
  final List<Translator> translators;
  final List<String> subjects;
  final List<String> bookshelves;
  final List<String> languages;
  final bool copyright;
  final String mediaType;
  final Map<String, String> formats;
  final int downloadCount;

  Book({
    required this.id,
    required this.title,
    required this.authors,
    required this.translators,
    required this.subjects,
    required this.bookshelves,
    required this.languages,
    required this.copyright,
    required this.mediaType,
    required this.formats,
    required this.downloadCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'] ?? 'Unknown Title',
      authors: (json['authors'] as List)
          .map((authorJson) => Author.fromJson(authorJson))
          .toList(),
      translators: (json['translators'] as List)
          .map((translatorJson) => Translator.fromJson(translatorJson))
          .toList(),
      subjects: List<String>.from(json['subjects'] ?? []),
      bookshelves: List<String>.from(json['bookshelves'] ?? []),
      languages: List<String>.from(json['languages'] ?? []),
      copyright: json['copyright'] ?? false,
      mediaType: json['media_type'] ?? 'Unknown',
      formats: Map<String, String>.from(json['formats'] ?? {}),
      downloadCount: json['download_count'] ?? 0,
    );
  }

  
 
}


class Author {
  final String name;
  final int? birthYear;
  final int? deathYear;

  Author({
    required this.name,
    this.birthYear,
    this.deathYear,
  });

 
  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'] ?? 'Unknown Author',
      birthYear: json['birth_year'],
      deathYear: json['death_year'],
    );
  }


}


class Translator {
  final String name;

  Translator({
    required this.name,
  });

 
  factory Translator.fromJson(Map<String, dynamic> json) {
    return Translator(
      name: json['name'] ?? 'Unknown Translator',
    );
  }

  
}
