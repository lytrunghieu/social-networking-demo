
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
}