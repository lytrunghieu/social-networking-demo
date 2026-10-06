import "package:flutter_bloc/flutter_bloc.dart";
import "package:social_networking_demo/features/feed/models/post_model.dart";
import "package:social_networking_demo/features/feed/cubit/feed_state.dart";

class FeedCubit extends Cubit<FeedState>{

  FeedCubit(): super(const FeedLoading());

  Future<void> loadFeed() async {
    try{
      emit(const FeedLoading());
      await Future.delayed(const Duration(milliseconds: 1500));

      final mockData = List.generate(
        20,
        (index) => PostModel(
          id: 'post_$index',
          authorName: 'Developer #$index',
          content: 'Nội dung bài viết số $index. Chia sẻ kiến thức Flutter cho anh em chuyển từ React Native.',
          createdAt: '${index + 1} giờ trước',
          likeCount: index * 2,
          isLiked: false,
        )
      );
      emit(FeedLoaded(mockData));
    }
    catch(e){
      emit(const FeedError('Không thể kết nối đến máy chủ. Vui lòng kiểm tra lại đường truyền.'));

    }
  }

  void toggleLikePost(String postId){
    if(state is! FeedLoaded) return;
    final currentState = state as FeedLoaded;
    final updatedPosts = currentState.posts.map((post){
      if(post.id == postId){
        final newIsLiked = !post.isLiked;
        return post.copyWith(
          isLiked: newIsLiked,
          likeCount: newIsLiked ? post.likeCount + 1 : post.likeCount  - 1
        );
      }
      return post;
    }).toList();
    emit(FeedLoaded(updatedPosts));
  }

}