import 'package:flutter/material.dart';
class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: null, label: Text('Add'), icon: Icon(Icons.add));
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    elevation: 0.0,
    child: Icon(Icons.add),
    backgroundColor: Colors.red,
    //shape：默认是圆形
    //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      //floatingActionButtonLocation:设置floatingActionButton的位置与底部工具栏贴合在一起
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        color: Theme.of(context).primaryColor,
        //在底部工具栏切出floatingActionButton的形状
        shape: CircularNotchedRectangle(),
      ),
      // floatingActionButton: _floatingActionButtonExtended,
    );
  }
}
