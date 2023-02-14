class Youtube {
  final String title;
  // final String kind;
  final String Image;


  Youtube({
    required this.title,
    // required this.kind,
    required this.Image,
});

  factory Youtube.fromJson({required Map json}) {
    return Youtube(
      title: json['items'],
      // kind: json['kind'],
      Image: json['items'][0]['snippet']['thumbnails']['medium']['url'],
    );
  }
}
