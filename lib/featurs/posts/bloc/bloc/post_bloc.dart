import 'dart:async';
import 'package:api_with_bloc/featurs/mappers/model/postDataModel.dart';
import 'package:api_with_bloc/featurs/repo/post_repoistory.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFatchEvent>(postInitialFatchEvent);
  }

  FutureOr<void> postInitialFatchEvent(
      PostInitialFatchEvent event, Emitter<PostState> emit) async {
    emit(PostLoadingState());
    List<PostDataModel> posts = await PostRepo.fatchPosts();

    emit(PostFatchingSuccessfullState(posts: posts));
  }
}
