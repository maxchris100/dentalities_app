import 'dart:convert';

class RecentSearch {
  String name;
  String type;

  RecentSearch({
    required this.name,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'name': name,
      'type': type,
    });

    return result;
  }

  factory RecentSearch.fromMap(Map<String, dynamic> map) {
    return RecentSearch(
      name: map['name'] ?? '',
      type: map['type'] ?? '',
    );
  }

  static List<RecentSearch> fromList(List data) {
    List<RecentSearch> res = [];
    for (var element in data) {
      res.add(RecentSearch.fromJson(element));
    }
    return res;
  }

  String toJson() => json.encode(toMap());

  factory RecentSearch.fromJson(String source) =>
      RecentSearch.fromMap(json.decode(source));
}

enum RecentSearchType { product }
