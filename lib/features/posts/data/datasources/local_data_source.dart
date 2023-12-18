import 'package:clean_architecture_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> posts);
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future<List<PostModel>> getCachedPosts() {
    // TODO: implement getCachedPosts
    throw UnimplementedError();
  }

  @override
  Future<Unit> cachePosts(List<PostModel> posts) {
    // TODO: implement cachePosts
    throw UnimplementedError();
  }
}
