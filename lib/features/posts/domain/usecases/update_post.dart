import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_app/features/posts/domain/repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class UpdatePost {
  final PostsRepository postsRepository;

  UpdatePost(this.postsRepository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await postsRepository.updatePost(post);
  }
}
