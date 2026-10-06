
class PostModel {
  final String id;
  final String authorName;
  final String content;
  final String createdAt;
  final int likeCount;
  final bool isLiked;

  const PostModel({
    required this.id,
    required this.authorName,
    required this.content,
    required this.createdAt,
    this.likeCount = 0,
    this.isLiked = false
  });

  PostModel copyWith({
    String? id,
    String? authorName,
    String? createdAt,
    String? content,
    int? likeCount,
    bool? isLiked,
  }){
    return PostModel(
      id: id ?? this.id,
      authorName: authorName ?? this.authorName,
      createdAt: createdAt ?? this.createdAt,
      likeCount: likeCount ?? this.likeCount,
      isLiked: isLiked ?? this.isLiked,
      content: content ?? this.content,
    );
  }
}