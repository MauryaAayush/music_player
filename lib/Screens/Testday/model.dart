class PostModel {
  int? total;
  int? skip;
  int? limit;
  List<Post>? posts;

  PostModel({this.total, this.skip, this.limit, this.posts});

  factory PostModel.fromJson(Map json) {
    return PostModel(
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
      posts: json['posts'] != null ? (json['posts'] as List).map((e) => Post.fromJson(e)).toList() : null,
    );
  }
}

class Post {
  String? title;
  String? body;
  int? id;
  int? views;
  int? userId;
  List<String>? tags;

  Post({this.title, this.body, this.id, this.views, this.userId, this.tags});

  factory Post.fromJson(Map json) {
    return Post(
      userId: json['userId'],
      views: json['views'],
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      id: json['id'],
      body: json['body'],
      title: json['title'],
    );
  }
}


class Reaction {
  int? likes;
  int? dislikes;

  Reaction({this.likes, this.dislikes});

  factory Reaction.fromJson(Map json) {
    return Reaction(
      likes: json['likes'],
      dislikes: json['dislikes'],
    );
  }
}
