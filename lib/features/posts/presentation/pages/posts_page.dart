import 'package:clean_architecture_app/core/widgets/loading_widget.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_architecture_app/features/posts/presentation/widgets/message_display_widget.dart';
import 'package:clean_architecture_app/features/posts/presentation/widgets/posts_list_widge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: _buildFloatingBtn(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        title: const Text('Posts'),
      );

  Widget _buildBody() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoading) {
              return const LoadingWidget();
            } else if (state is PostsLoaded) {
              return RefreshIndicator(
                child: PostsListWidget(posts: state.posts),
                onRefresh: () => _onRefresh(context),
              );
            } else if (state is PostsError) {
              return MessageDisplayWidget(state.message);
            }
            return const LoadingWidget();
          },
        ),
      );

  Widget _buildFloatingBtn() => FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Post',
        child: const Icon(Icons.add),
      );

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(GetAllPostsEvent());
  }
}
