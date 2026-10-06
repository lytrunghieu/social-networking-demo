import 'package:flutter/material.dart';
import 'package:social_networking_demo/features/feed/models/post_model.dart';
import 'package:social_networking_demo/features/feed/presentations/widgets/like_button.dart';


class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({
    super.key,
    required this.post
  });

  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:[
                Text(
                  post.authorName,
                  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  )
                ),
                Text(
                  post.createdAt,
                  style:  TextStyle(
                    color: Colors.grey.shade600,
                    fontSize:12
                  )
                )

              ]
            ),
            const SizedBox(height: 12),
            Text(
              post.content,
              style: const TextStyle(
                fontSize: 14,
                height: 1.4
              )
            ),
            const SizedBox(height: 16),
            const Divider(height:1),
            const SizedBox(height:8),
            LikeButton(
              initialLikeCount: post.likeCount,
              initialIsLiked : post.isLiked,
              onLikeChanged: (isLiked){
                debugPrint('Post ${post.id} is Liked: ${post.isLiked}');
              },
            ),
          ],
        ),
      ),
    );
  } 
}