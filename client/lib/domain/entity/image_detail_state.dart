class ImageDetailState {
  final String filename;
  final String imageUrl;
  final String createdAt;

  ImageDetailState({
    required this.filename,
    required this.imageUrl,
    required this.createdAt,
  });

  ImageDetailState copyWith(
      {String? filename, String? imageUrl, String? createdAt}) {
    return ImageDetailState(
      filename: filename ?? this.filename,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory ImageDetailState.empty() {
    return ImageDetailState(
      filename: '',
      imageUrl: '',
      createdAt: '',
    );
  }

  factory ImageDetailState.fromJson(Map<String, dynamic> json) {
    return ImageDetailState(
      filename: json['filename'],
      imageUrl: json['image_url'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'filename': filename,
      'image_url': imageUrl,
      'created_at': createdAt,
    };
  }
}
