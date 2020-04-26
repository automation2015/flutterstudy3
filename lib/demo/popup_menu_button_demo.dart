import 'package:flutter/material.dart';
class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
   String _currentMenuItem='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupButtonDemo'),
        elevation: 0.0,
      ),
      body:Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_currentMenuItem),
              PopupMenuButton(
                onSelected: (value){
                  print(value);
                  setState(() {
                    _currentMenuItem=value;
                  });
                },
                itemBuilder: (BuildContext context)=>[
                  PopupMenuItem(child: Text('Home'),
                  value:'Home'),
                   PopupMenuItem(child: Text('Explorer'),
                  value:'Explorer'),
                   PopupMenuItem(child: Text('Discover'),
                  value:'Discover'),
                ] ,),
                
                
            ],)
          ],
        ),)
    );
  }
}