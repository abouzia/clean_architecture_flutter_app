import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:flutter/material.dart';

class PostsListWidget extends StatelessWidget {
  final List<Post> posts;

  const PostsListWidget({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          leading: Text(post.id.toString()),
          title: Text(post.title),
          subtitle: Text(post.body),
          contentPadding: const EdgeInsets.all(8),
          onTap: () {
            // TODO: Add navigation
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(thickness: 1);
      },
      physics: const BouncingScrollPhysics(),
    );
  }
}
