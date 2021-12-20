import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  final int id;
  final int userId;
  final String title;
  final String body;

  User({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Applying get request.

  Future<List<User>> getRequest() async {
    //replace your restFull API here.
    String url = "https://jsonplaceholder.typicode.com/posts";
    final response = await http.get(url);

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<User> users = [];
    for (var singleUser in responseData) {
      User user = User(
          id: singleUser["id"],
          userId: singleUser["userId"],
          title: singleUser["title"],
          body: singleUser["body"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Column(children: [
                  Text(snapshot.data[0].body != null
                      ? '${snapshot.data[0].body}'
                      : "Empty"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data[1].body != null
                      ? '${snapshot.data[1].body}'
                      : "Empty"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data[2].body != null
                      ? '${snapshot.data[2].body}'
                      : "Empty"),
                  SizedBox(
                    height: 20,
                  ),
                ]);
              }
              ;
            }));
  }
}
