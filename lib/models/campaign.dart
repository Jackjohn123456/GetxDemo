enum Status { application, complete, inProgress }

class Campaign {
  final int id;
  final String title;
  final String subTitle;
  final List<String> tags;
  final Status status;
  final String posterPath;

  Campaign({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.tags,
    required this.status,
    required this.posterPath,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'] as int,
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      tags: List<String>.from(json['tags'] ?? []),
      status: Status.values.firstWhere(
            (e) => e.name == json['status'],  // match by string name
      ),
      posterPath: json['posterPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'tags': tags,
      'status': status,
      'posterPath': posterPath,
    };
  }

}
