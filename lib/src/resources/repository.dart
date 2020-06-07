import 'dart:async';
import 'repository_api_provider.dart';
import '../models/item_repository.dart';

class Repository{
  final repoApiProvider = RepoApiProvider();

  Future<List<ItemRepo>> fetchAllRepo() => repoApiProvider.fetchRepoList();
}