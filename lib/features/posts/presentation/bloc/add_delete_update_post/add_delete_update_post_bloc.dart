import 'package:bloc/bloc.dart';
import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/core/strings/failures.dart';
import 'package:clean_architecture_app/core/strings/messages.dart';
import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_app/features/posts/domain/usecases/add_post.dart';
import 'package:clean_architecture_app/features/posts/domain/usecases/delete_post.dart';
import 'package:clean_architecture_app/features/posts/domain/usecases/update_post.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'add_delete_update_post_event.dart';
part 'add_delete_update_post_state.dart';

class AddDeleteUpdatePostBloc
    extends Bloc<AddDeleteUpdatePostEvent, AddDeleteUpdatePostState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;
  AddDeleteUpdatePostBloc({
    required this.addPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(AddDeleteUpdatePostInitial()) {
    on<AddDeleteUpdatePostEvent>((event, emit) async {
      if (event is addPostEvent) {
        emit(AddDeleteUpdatePostLoading());

        final failureOrSuccess = await addPost(event.post);

        emit(
          _addDeleteUpdatePostState(failureOrSuccess, ADD_SUCCESS_MESSAGE),
        );
      } else if (event is updatePostEvent) {
        emit(AddDeleteUpdatePostLoading());

        final failureOrSuccess = await updatePost(event.post);

        emit(
          _addDeleteUpdatePostState(failureOrSuccess, UPDATE_SUCCESS_MESSAGE),
        );
      } else if (event is deletePostEvent) {
        emit(AddDeleteUpdatePostLoading());

        final failureOrSuccess = await deletePost(event.postId);

        emit(
          _addDeleteUpdatePostState(failureOrSuccess, DELETE_SUCCESS_MESSAGE),
        );
      }
    });
  }

  AddDeleteUpdatePostState _addDeleteUpdatePostState(
    Either<Failure, Unit> failureOrSuccess,
    String message,
  ) {
    return failureOrSuccess.fold(
      (failure) => AddDeleteUpdatePostError(
        message: _mapFailureToMessage(failure),
      ),
      (success) => AddDeleteUpdatePostLoaded(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure():
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure():
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return UNEXPECTED_ERROR;
    }
  }
}
