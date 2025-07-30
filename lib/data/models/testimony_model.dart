class Testimony {
  final int id;
  final String title;
  final String slug;
  final String subTitle;
  final String attachmentUrl;
  final String imageUrl;
  final String type;

  Testimony({
    required this.id,
    required this.title,
    required this.slug,
    required this.subTitle,
    required this.attachmentUrl,
    required this.imageUrl,
    required this.type,
  });

  factory Testimony.fromJson(Map<String, dynamic> json) {
    return Testimony(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      subTitle: json['sub_title'],
      attachmentUrl: json['attachment_url'],
      imageUrl: json['image_url'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'sub_title': subTitle,
      'attachment_url': attachmentUrl,
      'image_url': imageUrl,
      'type': type,
    };
  }

  static List<Testimony> fromList(List<dynamic> list) {
    return list.map((item) => Testimony.fromJson(item)).toList();
  }
}
