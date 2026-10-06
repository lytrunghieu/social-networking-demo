import "package:flutter/material.dart";
import "package:social_networking_demo/features/feed/presentations/widgets/post_card.dart";
import "package:social_networking_demo/features/feed/models/post_model.dart";

class FeedScreen extends StatelessWidget {
  final List<PostModel> posts;

  const FeedScreen({
    super.key,
    required this.posts
  });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bảng Tin"),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index){
          final post = posts[index];
          return PostCard(
            key: ValueKey(post.id),
            post: post,
          );
        },
      )
    );
  }
}