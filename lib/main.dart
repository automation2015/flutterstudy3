import 'package:flutter/material.dart';
import 'model/post.dart';
void main()=>runApp(App());
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('NINGHAO'),
          //设置appBar的阴影大小
          elevation: 30.0,),
        body:Hello(),
          ),
        theme: ThemeData(primaryColor: Colors.yellow),
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