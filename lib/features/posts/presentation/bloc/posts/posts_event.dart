part of 'posts_bloc.dart';

sealed class PostsEvent extends Equatable {
  const PostsEvent();

  @override
  List<Object> get props => [];
}

class getAllPostsEvent extends PostsEvent {}

class refreshPostsEvent extends PostsEvent {}
