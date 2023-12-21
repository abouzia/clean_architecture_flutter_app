import 'package:clean_architecture_app/core/util/snackbar_message.dart';
import 'package:clean_architecture_app/core/widgets/loading_widget.dart';
import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostAddUpdatePage extends StatelessWidget {
  final Post? post;

  const PostAddUpdatePage({super.key, this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(post == null ? 'Add Post' : 'Update Post'),
    );
  }

  Widget _buildBody() {
    return Center(
      child: BlocConsumer<AddDeleteUpdatePostBloc, AddDeleteUpdatePostState>(
        listener: (BuildContext context, AddDeleteUpdatePostState state) {
          if (state is AddDeleteUpdatePostLoaded) {
            SnackBarMessage.showSuccessMessage(state.message, context);
            Navigator.of(context).pop();
          } else if (state is AddDeleteUpdatePostError) {
            SnackBarMessage.showErrorMessage(state.message, context);
          }
        },
        builder: (BuildContext context, AddDeleteUpdatePostState state) {
          if (state is AddDeleteUpdatePostLoaded) {
            return const SizedBox.shrink();
          }

          if (state is AddDeleteUpdatePostLoading) {
            return const LoadingWidget();
          }
          return const SizedBox.shrink();
          //return FormWidget(post: post, isUpdate: isUpdate);
        },
      ),
    );
  }
}
