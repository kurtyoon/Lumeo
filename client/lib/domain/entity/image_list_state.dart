class ImageListState<T> {
  final List<T> images;
  final String nextToken;

  ImageListState({
    required this.images,
    required this.nextToken,
  });

  factory ImageListState.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ImageListState<T>(
      images: (json['images'] as List)
          .map((item) => fromJsonT(item as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'],
    );
  }

  factory ImageListState.initial() {
    return ImageListState(
      images: [],
      nextToken: '',
    );
  }
}
