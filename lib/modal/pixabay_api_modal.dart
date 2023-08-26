class pixabay_api {
  final int downloads;
  final int likes;
  final String largeImageURL;
  final int views;

  pixabay_api(
      {required this.largeImageURL,
        required this.views,
        required this.likes,
        required this.downloads});

  factory pixabay_api.getData({required Map data}) {
    return pixabay_api(
        largeImageURL: data['largeImageURL'],
        views: data['views'],
        likes: data['likes'],
        downloads: data['downloads']);
  }
}