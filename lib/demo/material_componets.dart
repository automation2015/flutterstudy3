import 'package:flutter/material.dart';
import './button_demo.dart';
import './floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';
import './form_demo.dart';
import './checkbox_demo.dart';

class MaterialComponents extends StatelessWidget {
  /*
  1、自定义代码片段，详见dart.json文件；
  2、FlatButton：
  3、RaisedButton：
  4、OutlineButton:描边Button,
  5、fixedWidthButtonDemo:固定宽度Button
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MaterialComponents'),
          elevation: 0.0,
        ),
        body: ListView(
          children: <Widget>[
            ListItem(
              title: 'FloatingActionButton',
              page: FloatingActionButtonDemo(),
            ),
            ListItem(
              title: 'Button',
              page: ButtonDemo(),
            ),
            ListItem(title: 'PopupMenuButtonDemo', page: PopupMenuButtonDemo()),
            ListItem(title: 'Form', page: FormDemo()),
            ListItem(title: 'CheckBoxDemo', page: CheckBoxDemo()),
          ],
        ));
  }
}

class _widgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('_widgetDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              )
            ],
          ),
        ));
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({this.title, this.page});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
