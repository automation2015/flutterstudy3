import 'package:flutter/material.dart';
import 'dart:async';
enum Options{
  A, B,C
}
class SimpleDialogDemo extends StatefulWidget {
  /*
  1、SimpleDialog:
  */

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice='Nothing';
  _openSimpleDialog() async{
    final option=await showDialog (
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(title: Text('SimpleDialog'),
        children: <Widget>[
          SimpleDialogOption(child: Text('Option A'),onPressed: (){Navigator.pop(context,Options.A);},),
           SimpleDialogOption(child: Text('Option B'),onPressed: (){Navigator.pop(context,Options.B);},),
            SimpleDialogOption(child: Text('Option B'),onPressed: (){Navigator.pop(context,Options.C);},)
        ],);
      }
    );
    switch(option){
      case Options.A:
      setState(() {_choice='A';});     
      break;     
      case Options.B:
      setState(() {_choice='B';});     
      break;
      case Options.C:
      setState(() {_choice='C';});
      break;
      default:
      setState(() {_choice='null';});     
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SimpleDialogDemo'),elevation: 0.0,),
      body:Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is :$_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],)
          ],
        ),
        ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.format_list_numbered),
        onPressed: _openSimpleDialog,
      ) 
    );
  }
}