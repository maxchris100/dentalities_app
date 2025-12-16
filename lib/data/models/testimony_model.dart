class Testimony {
  int? id;
  String? title;
  String? name;
  String? pictureUrl;
  String? slug;
  String? subTitle;
  String? attachmentUrl;
  String? imageUrl;
  String? type;
  DateTime? createdAt;

  Testimony({
    this.id,
    this.title,
    this.name,
    this.pictureUrl,
    this.slug,
    this.subTitle,
    this.attachmentUrl,
    this.imageUrl,
    this.type,
    this.createdAt,
  });

  factory Testimony.fromJson(Map<String, dynamic> json) {
    return Testimony(
      id: json['id'],
      title: json['title'] ?? json['value_text'],
      name: json['name'],
      pictureUrl: json['picture_url'],
      slug: json['slug'],
      subTitle: json['sub_title'],
      attachmentUrl: json['attachment_url'],
      imageUrl: json['image_url'] ?? json['value_image'],
      type: json['type'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
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
