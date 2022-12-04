
import 'package:kortoba_flutter_task/src/data/models/story_model.dart';
import 'package:kortoba_flutter_task/src/domain/entities/comment.dart';

class CommentModel extends Comment {
  String? text;
  int? commentId;
  StoryModel? story;
  String? by;
  int? descendants;
  int? score;
  int? time;
  String? type;

  CommentModel({this.commentId, this.text, this.story,this.by,this.score,this.time,this.type,this.descendants})
      : super(
            text: text,
            commentId: commentId,
            commentStory: story,
            time: time,
            score: score,
            by: by);

  CommentModel.fromJson(dynamic json) {
    commentId = json['id'];
    text = json['text'];
    score = json['score'];
    time = json['time'];
    // title = json['title'];
    type = json['type'];
    by = json['by'];
  }
}
