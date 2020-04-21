import 'package:flutter/material.dart';
import 'model/post.dart';
void main()=>runApp(App());
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Home(),
        theme: ThemeData(primaryColor: Colors.yellow),
    ); 
  }
}
class Home extends StatelessWidget{
  Widget _listItemBuild(BuildContext context,int index){
   return Container(
     color: Colors.white,
     margin: EdgeInsets.all(8.0),
     child:Column(
       children: <Widget>[
         Image.network(posts[index].imageUrl),
         SizedBox(height: 16.0,),
         Text(posts[index].title,style: Theme.of(context).textTheme.title,),
         Text(posts[index].author,style: Theme.of(context).textTheme.subtitle,),
        SizedBox(height: 16.0,),
       ],
     ) ,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('NINGHAO'),
          //设置appBar的阴影大小
          elevation: 30.0,),
        //body:Hello(),
        body:ListView.builder(
          itemCount:posts.length,
          itemBuilder: _listItemBuild)
          );
  }
}
class Hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(fontSize: 40.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
        color: Colors.black         
        ),),
        );
  }
}