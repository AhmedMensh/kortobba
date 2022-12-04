
import 'package:kortoba_flutter_task/src/domain/entities/story.dart';

class StoryModel extends Story {
  StoryModel({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  }) : super(
            id: id,
            title: title,
            url: url,
            kids: kids,
            type: type,
            by: by,
            descendants: descendants,
            score: score,
            time: time);

  StoryModel.fromJson(dynamic json) {
    by = json['by'];
    descendants = json['descendants'];
    id = json['id'];
    kids = json['kids'] != null ? json['kids'].cast<int>() : [];
    score = json['score'];
    time = json['time'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
  }

  String? by;
  int? descendants;
  int? id;
  List<int>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  StoryModel copyWith({
    String? by,
    int? descendants,
    int? id,
    List<int>? kids,
    int? score,
    int? time,
    String? title,
    String? type,
    String? url,
  }) =>
      StoryModel(
        by: by ?? this.by,
        descendants: descendants ?? this.descendants,
        id: id ?? this.id,
        kids: kids ?? this.kids,
        score: score ?? this.score,
        time: time ?? this.time,
        title: title ?? this.title,
        type: type ?? this.type,
        url: url ?? this.url,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['by'] = by;
    map['descendants'] = descendants;
    map['id'] = id;
    map['kids'] = kids;
    map['score'] = score;
    map['time'] = time;
    map['title'] = title;
    map['type'] = type;
    map['url'] = url;
    return map;
  }
}
