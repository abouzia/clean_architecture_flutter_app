import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_app/features/posts/domain/repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase {
  final PostsRepository postsRepository;

  GetAllPostsUseCase(this.postsRepository);

  Future<Either<Failure, List<Post>>> call() async {
    return await postsRepository.getAllPosts();
  }
}
