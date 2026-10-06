import "package:flutter/material.dart";
import "package:social_networking_demo/features/feed/presentations/widgets/post_card.dart";
import "package:social_networking_demo/features/feed/models/post_model.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:social_networking_demo/features/feed/cubit/feed_state.dart";
import "package:social_networking_demo/features/feed/cubit/feed_cubit.dart";

class FeedScreen extends StatelessWidget {
  final List<PostModel> posts;

  const FeedScreen({
    super.key,
    required this.posts
  });

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => FeedCubit()..loadFeed(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bảng Tin"),
          centerTitle: false,
        ),
        body: BlocBuilder<FeedCubit,FeedState>(
          builder: (context, state){
          return switch(state){
            FeedLoading() => const Center(child: CircularProgressIndicator()),
            FeedError(:final message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(message, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed:() => context.read<FeedCubit>().loadFeed(),
                    child: const Text('Thử lại')
                  ),
                ],
              )
            ),
            FeedLoaded(:final posts) => ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index){
                    final post = posts[index];
                    return PostCard(
                      key: ValueKey(post.id),
                      post: post,
                    );
                  },
            ),
          };
          },
        ),
      ),
    );
  }
}

