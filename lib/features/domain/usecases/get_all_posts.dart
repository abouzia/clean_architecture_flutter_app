import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/domain/entities/post.dart';
import 'package:clean_architecture_app/features/domain/repositories/posts_repisitory.dart';
import 'package:dartz/dartz.dart';

class GetAllPosts {
  final PostsRepository postsRepository;

  GetAllPosts(this.postsRepository);

  Future<Either<Failure, List<Post>>> call() async {
    return await postsRepository.getPosts();
  }
}
