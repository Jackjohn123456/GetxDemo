enum Status { application, complete, inProgress }

class Campaign {
  final int id;
  final String title;
  final String subTitle;
  final List<String> tags;
  Status status;
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
      id: int.parse(json['id']) ,
      title: json['title'] as String,
      subTitle: json['subtitle'] as String,
      tags: List<String>.from(json['tags'] ?? []),
      status: Status.values.firstWhere((element) => element.name==json["status"] as String, orElse: () => Status.application,),
      posterPath: json['posterPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subTitle': subTitle,
      'tags': tags,
      'posterPath': posterPath,
      'status':status.name
    };
  }
}
