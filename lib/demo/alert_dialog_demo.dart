import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
enum Actions{
  Ok,Cancel
}
class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice='Nothing';
  Future<void> _openAlertDialog() async{
    final action=await showDialog(
      barrierDismissible: false,//控制用户必须选择选项，防止点击空白处退出对话框
      context: context,
      builder: (BuildContext context){
        return AlertDialog(         
          title: Text('AlertDialog'),
          content: Text('Are you sure about this?'),
          actions: <Widget>[
            FlatButton(
              onPressed: ()=>Navigator.pop(context,Actions.Cancel),
              child: Text('Cancel'),),
              FlatButton(
              onPressed: ()=>Navigator.pop(context,Actions.Ok),
              child: Text('Ok'),)
          ],);
      }
    );
    switch(action){
      case Actions.Cancel:
      setState(() {_choice='Cancel';});
      break;
      case Actions.Ok:
      setState(() {_choice='Ok';});
      break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlertDialogDemo'),elevation: 0.0,),
      body:Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your choice is: $_choice.'),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(child: Text('Open'),onPressed: _openAlertDialog,)
              ],)
          ],),
          )
    );
  }
} 