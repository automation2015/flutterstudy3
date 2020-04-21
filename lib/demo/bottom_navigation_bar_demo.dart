import 'package:flutter/material.dart';
class BottomNavigationBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BottomNavigationBarDemoState();
  }
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo>
{
  int _currentIndex=0;
  void _currentIndexHandler(int index){
    setState(() {
      _currentIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
      onTap: _currentIndexHandler,
           currentIndex: _currentIndex,
           type: BottomNavigationBarType.fixed,//item个数>=4
           fixedColor: Colors.black12,//选中时的颜色
           items: [
             BottomNavigationBarItem(icon: Icon(Icons.explore),title: Text('Explore')),
             BottomNavigationBarItem(icon: Icon(Icons.history),title: Text('History')),
             BottomNavigationBarItem(icon: Icon(Icons.list),title: Text('List')),
             BottomNavigationBarItem(icon: Icon(Icons.person),title: Text('My')),
           ],);
  }
}