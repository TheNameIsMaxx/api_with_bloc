import 'package:api_with_bloc/featurs/posts/bloc/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(PostInitialFatchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffcce3de),
        appBar: AppBar(
          title: const Text(
            "Post APi",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Color(0xff00a896),
        ),
        body: BlocConsumer<PostBloc, PostState>(
          bloc: postBloc,
          listenWhen: (previous, current) => current is PostActionState,
          buildWhen: (previous, current) => current is! PostActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              // ignore: pattern_never_matches_value_type
              case PostLoadingState():
                return const Center(child: CircularProgressIndicator());

              case PostFatchingSuccessfullState:
                // ignore: prefer_const_declarations, unused_local_variable
                final successState = state as PostFatchingSuccessfullState;
                return ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffb8bedd)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${successState.posts[index].title}",
                              style: const TextStyle(
                                fontSize: 16.3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("${successState.posts[index].body}")
                          ],
                        ),
                      );
                    });

              default:
                return const SizedBox();
            }
          },
        ));
  }
}
