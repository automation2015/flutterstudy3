import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CardDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: posts.map((post) {
              return Card(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      //ClipRRect:处理图像将Card圆角遮挡的情况
                      child: ClipRRect(
                        child: Image.network(post.imageUrl, fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0)
                      ),),
                      aspectRatio: 16.0 / 9.0,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(post.imageUrl)),
                      title: Text(post.title),
                      subtitle: Text(post.author),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        post.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ButtonTheme.bar(
                      child:ButtonBar(children: <Widget>[
                        FlatButton(child: Text('Like'.toUpperCase()),onPressed: (){

                        },),
                         FlatButton(child: Text('Read'.toUpperCase()),onPressed: (){
                          
                        },)
                      ],)
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ));
  }
}
