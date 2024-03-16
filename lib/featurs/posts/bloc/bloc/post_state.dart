part of 'post_bloc.dart';

@immutable
abstract class PostState {}

abstract class PostActionState extends PostState {}

final class PostInitial extends PostState {}

final class PostLoadingState extends PostState {}

final class PostErrorState extends PostState {}

class PostFatchingSuccessfullState extends PostState {
  final List<PostDataModel> posts;
  PostFatchingSuccessfullState({required this.posts});
}
