import 'package:flutter/material.dart';
import 'package:flutterstudy3/demo/post_show.dart';
//'../':表示相对于本目录的上一级目录
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listItemBuild(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(child: Image.network(posts[index].imageUrl,fit:BoxFit.cover),aspectRatio: 16.0/9.0,),
              SizedBox(
                height: 16.0,
              ),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle,
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
         //溅墨效果
          Positioned.fill(
            child:Material(
              color: Colors.transparent,
              child: InkWell(
              highlightColor: Colors.white.withOpacity(0.1),
              splashColor: Colors.white.withOpacity(0.3),
              onTap: (){
                debugPrint('ontap');
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>PostShow(post:posts[index])));},),
          ),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length, itemBuilder: _listItemBuild);
  }
}
