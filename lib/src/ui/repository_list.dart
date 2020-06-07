import 'package:flutter/material.dart';
import '../models/item_repository.dart';
import '../blocs/repository_bloc.dart';

class RepoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllRepo();
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending Repo"),
      ),
      body: StreamBuilder(
        stream: bloc.allRepo,
        builder: (context, AsyncSnapshot<List<ItemRepo>> snapshot) {
          if (snapshot.hasData) {
            return buildPost(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget buildPost(AsyncSnapshot<List<ItemRepo>> snapshot) {
    return ListView.builder(
        padding: EdgeInsets.all(10.0),
        shrinkWrap: false,
        itemCount: snapshot.data.length,
        itemBuilder: (BuildContext context, int index) {
          final repo = snapshot.data[index];
          return repoListRow(repo);
        });
  }

  Widget repoListRow(ItemRepo itemPost) {
    return Card(
      elevation: 5,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            width: 65.0,
            height: 65.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(itemPost.authorImage))),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    itemPost.author,
                    style: TextStyle(fontSize: 13.0, color: Colors.black87),
                  ),
                  margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                ),
                Container(
                  child: Text(
                    itemPost.name,
                    style: TextStyle(fontSize: 15.0, color: Colors.black),
                  ),
                  margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
