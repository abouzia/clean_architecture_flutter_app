import 'dart:convert';

import 'package:clean_architecture_app/core/error/exceptions.dart';
import 'package:clean_architecture_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

class LocalDataSourceImpl implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    final postsToCache = postModels
        .map<Map<String, dynamic>>((postModel) => postModel.toJson())
        .toList();

    sharedPreferences.setString('CACHED_POSTS', jsonEncode(postsToCache));

    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString('CACHED_POSTS');

    if (jsonString != null) {
      final List parsedJson = jsonDecode(jsonString);

      List<PostModel> postModels = parsedJson.map<PostModel>((json) {
        return PostModel.fromJson(json);
      }).toList();

      return Future.value(postModels);
    } else {
      throw CacheException();
    }
  }
}
