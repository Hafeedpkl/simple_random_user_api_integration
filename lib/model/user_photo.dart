class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });
  factory Picture.fromMap(Map<String, dynamic> json) {
    return Picture(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail']);
  }
}
