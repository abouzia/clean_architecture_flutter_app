part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostEvent extends Equatable {
  const AddDeleteUpdatePostEvent();

  @override
  List<Object> get props => [];
}

class addPostEvent extends AddDeleteUpdatePostEvent {
  final Post post;

  const addPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class updatePostEvent extends AddDeleteUpdatePostEvent {
  final Post post;

  const updatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class deletePostEvent extends AddDeleteUpdatePostEvent {
  final int postId;

  const deletePostEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}
