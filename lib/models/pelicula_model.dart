class Peliculas {
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJson(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String uniqueId;
  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  DateTime releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

//  Pelicula.fromJson(Map<String, dynamic> json) {
//    popularity = json["popularity"].toDouble();
//    voteCount = json["vote_count"];
//    video = json["video"];
//    posterPath = json["poster_path"];
//    id = json["id"];
//    adult = json["adult"];
//    backdropPath = json["backdrop_path"];
//    originalLanguage = json["original_language"];
//    originalTitle = json["original_title"];
//    genreIds = List<int>.from(json["genre_ids"].map((x) => x));
//    title = json["title"];
//    voteAverage = json["vote_average"].toDouble();
//    overview = json["overview"];
//    releaseDate = DateTime.parse(json["release_date"]);
//  }

  factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        popularity: json["popularity"].toDouble(),
        voteCount: json["vote_count"],
        video: json["video"],
        posterPath: json["poster_path"],
        id: json["id"],
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
      );

  getBackroundImage() {
    if (posterPath == null) {
      return 'https://image.shutterstock.com/image-vector/not-available-grunge-rubber-stamp-260nw-549465907.jpg';
    }
    return 'https://image.tmdb.org/t/p/original/$backdropPath';
  }

  getPosterImg() {
    if (posterPath == null) {
      return 'https://image.shutterstock.com/image-vector/not-available-grunge-rubber-stamp-260nw-549465907.jpg';
    }
    return 'https://image.tmdb.org/t/p/original/$posterPath';
  }
}
