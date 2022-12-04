import 'package:equatable/equatable.dart';

class Story extends Equatable{

   final int? id;
   final String? title;
   final String? url;
  final List<int>? kids;
   String? by;
   int? descendants;
   int? score;
   int? time;
   String? type;

  Story({this.id,this.title,this.url,this.kids,this.type,this.by,this.score,this.time,this.descendants});

  @override
  List<Object?> get props => [id,title,url,kids,type,time,url];

}