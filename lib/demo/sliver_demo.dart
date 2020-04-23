import 'package:flutter/material.dart';
import '../model/post.dart';

/*
1、Sliver：SliverPadding用于给SliverGrid设置padding，SliverSafeArea用于将页面显示在正常页面范围内，刘海区域不显示
2、SliverList：
3、SliverAppBar：与AppBar的区别是AppBar是固定在屏幕上的，SliverAppBar可以随着手势的活动，收缩、渐变、隐藏
*/
class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          //title:Text('SliverAppBar') ,
          //pinned: true,//设置为固定的
          //floating: true,//设置为浮动的
          expandedHeight: 180.0,//设置伸展区域大小
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'FlexibeSpaceBar'.toUpperCase(),
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 3.0),
            ),
            background: Image.network('https://resources.ninghao.net/images/overkill.png',fit:BoxFit.cover),
          ),
        ),
        SliverSafeArea(
          sliver: SliverPadding(
            sliver: SliverGridDemo(),
            padding: EdgeInsets.all(8.0),
          ),
        )
      ],
    ));
  }
}

class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 32.0),
            child: Material(
                borderRadius: BorderRadius.circular(12.0),
                elevation: 14.0,
                shadowColor: Colors.grey.withOpacity(0.5),
                child: Stack(children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16.0 / 9.0,
                    child:
                        Image.network(posts[index].imageUrl, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 30.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(posts[index].title,
                            style:
                                TextStyle(color: Colors.white, fontSize: 32.0)),
                        Text(
                          posts[index].title,
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        )
                      ],
                    ),
                  )
                ])));
      }, childCount: posts.length),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        );
      }, childCount: posts.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 16 / 9,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0),
    );
  }
}
