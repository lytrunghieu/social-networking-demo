import "package:flutter/foundation.dart";
import "package:social_networking_demo/features/feed/models/post_model.dart";

@immutable
sealed class FeedState{
  const FeedState();
}

final class FeedLoading extends FeedState{
  const FeedLoading();
}

final class FeedLoaded extends FeedState{
  final List<PostModel> posts;
  const FeedLoaded(this.posts);
}

final class FeedError extends FeedState{
  final String message;
  const FeedError(this.message);
}





