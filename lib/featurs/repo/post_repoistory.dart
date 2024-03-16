import 'dart:convert';

import 'package:api_with_bloc/featurs/mappers/model/postDataModel.dart';
import 'package:http/http.dart' as http;

class PostRepo {
  static Future<List<PostDataModel>> fatchPosts() async {
    var client = http.Client();

    List<PostDataModel> posts = [];

    try {
      var response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      );

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataModel post =
            PostDataModel.fromMap(result[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (ex) {
      print(ex.toString());
      return [];
    }
  }
}
