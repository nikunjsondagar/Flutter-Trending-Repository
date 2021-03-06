import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_repository.dart';

class RepoApiProvider {
  Client client = Client();

  Future<List<ItemRepo>> fetchRepoList() async {
    print("entered");
    final response =
        await client.get("https://github-trending-api.now.sh/repositories");
    print(response.body);
    if (response.statusCode == 200) {
      String res = response.body;
      List<dynamic> list = json.decode(res);
      List<ItemRepo> _list = [];
      for (int i = 0; i < list.length; i++) {
        ItemRepo post = ItemRepo.fromJSON(list[i]);
        _list.add(post);
      }
      return _list;
    } else {
      throw Exception("Failed to load post");
    }
  }
}
