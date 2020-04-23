import 'dart:io';

import 'package:flutter/material.dart';
import '../model/post.dart';

/*
1、PageView;
2、PageView.builder;
3、GridView.count:GridView默认是垂直滑动
*/
class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridViewCountDemo();
  }
}
class GridViewCountDemo extends StatelessWidget{
  List<Widget> _buildTiles(int length){
    return  List.generate(length, (int index){
      return Container(
      color: Colors.grey[300],
        alignment: Alignment(0.0,0.0),
        child: Text('Item',style: TextStyle(color:Colors.grey,fontSize: 18.0),
        ),
        );
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.count(
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      crossAxisCount: 3,
      children: <Widget>[
      
      ],
      );//GridView默认是垂直滑动
  }
}
class PageViewBuilderDemo extends StatelessWidget{
  
   Widget _pageItemBuild(BuildContext context, int index) {
      return Stack(
        children: <Widget>[
          SizedBox.expand(
              child: Image.network(posts[index].imageUrl, fit: BoxFit.cover)),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  posts[index].author,
                ),
              ],
            ),
          )
        ],
      );
    }
    @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuild,
    );
  }
}
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: false, //多动页面时没有弹出的效果
      reverse: true, //倒序,
      scrollDirection: Axis.vertical, //设置滑动的方向
      onPageChanged: (currentPage) => debugPrint('$currentPage'),
      controller: PageController(
          initialPage: 1, //设置初始页面索引值
          keepPage: false, //设置是否记住页面
          viewportFraction: 0.80 //设置可视口所占比例
          ),
      children: <Widget>[
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.brown[900],
          child: Text(
            'ONE',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.brown[900],
          child: Text(
            'TWO',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.brown[900],
          child: Text(
            'THREE',
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        )
      ],
    );
  }
}
