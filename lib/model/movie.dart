class Movie {
  String title;
  String director;
  String? summary;
  String? review;
  String? writer;
  num star; // 별점 평가
  DateTime? dateTime;

  Movie(
      {required this.title,
      required this.director,
      this.summary,
      this.review,
      this.writer,
      required this.star,
      this.dateTime});
}
