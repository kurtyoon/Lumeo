class ImageBriefState {
  final String imageUrl;

  ImageBriefState({
    required this.imageUrl,
  });

  factory ImageBriefState.fromJson(Map<String, dynamic> json) {
    return ImageBriefState(
      imageUrl: json['image_url'],
    );
  }
}
