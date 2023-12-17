import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/domain/entities/post.dart';
import 'package:clean_architecture_app/features/domain/repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class DeletePost {
  final PostsRepository postsRepository;

  DeletePost(this.postsRepository);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await postsRepository.deletePost(post);
  }
}
