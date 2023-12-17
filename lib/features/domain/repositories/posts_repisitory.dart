import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/domain/entities/post.dart';
import 'package:dartz/dartz.dart';

abstract class PostsRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, Unit>> addPost(Post post);
  Future<Either<Failure, Unit>> updatePost(Post post);
  Future<Either<Failure, Unit>> deletePost(Post post);
}
