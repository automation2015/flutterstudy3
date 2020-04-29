import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterstudy3/demo/material_componets.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    // fetchPosts().then((value)=>print(value));
    final post = {'title': 'hello', 'desc': 'nice to meet you.'};
    //  print(post['title']);
    //  print(post['desc']);
    final postJson = json.encode(post);
    //print(postJson);
    final postJsonConvert = json.decode(postJson);
    //print(postJsonConvert);
    //print(postJsonConvert is Map);

    final postModel = Post.fromJson(postJsonConvert);
    //print('postModel title:${postModel.title}');
    //print('postModel desc:${postModel.desc}');
    //print('${json.encode(postModel)}');
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: fetchPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print('${snapshot.data}');
         print('connectionState:${snapshot.connectionState}');
         if(snapshot.connectionState==ConnectionState.waiting){
           return Center(child: Text('Loading......'),);
         }
        return ListView(
         
          children: snapshot.data.map<Widget>((item){
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(backgroundImage: NetworkImage(item.imageUrl),),
              );
          }).toList(),
        );
      },
    );
  }

  Future<List<Post>> fetchPosts() async {
    final resonse =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    // print('statusCode:${resonse.statusCode}');
    // print('statusBody:${resonse.body}');
    if (resonse.statusCode == 200) {
      final resonseBody = json.decode(resonse.body);
      List<Post> posts = resonseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fetch post.');
    }
  }
}

class Post {
  final int id;
  final String author;
  final String imageUrl;
  final String title;
  final String description;
  Post(this.id, this.title, this.description, this.imageUrl, this.author);

  Post.fromJson(Map json)
      : this.title = json['title'],
        this.id = json['id'],
        this.imageUrl = json['imageUrl'],
        this.author = json['author'],
        this.description = json['descr;iption'];
  Map toJson() => {'title': title, 'description': description};
}
