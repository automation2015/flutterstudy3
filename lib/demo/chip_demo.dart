import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  /*
  1、Chip：
  2、Divider：
  3、ActionChip：
  4、Filter Chip：
  5、ChiceChip：

  */
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['apple', 'banana', 'lemon'];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //将Row换成Wrap，Wrap超出屏幕边界后自动换行，且部件之间有间距
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                      backgroundColor: Colors.grey, child: Text('喵')),
                ),
                Chip(
                  label: Text('Wanghao'),
                  avatar: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://resources.ninghao.net/images/wanghao.jpg')),
                ),
                Chip(
                  label: Text('City'),
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',
                  onDeleted: () {},
                ),
                Divider(height: 32.0, color: Colors.grey, indent: 32.0 //添加缩进
                    ),
                Wrap(
                    spacing: 8.0,
                    children: _tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      );
                    }).toList()),
                Divider(
                  color: Colors.green,
                  height: 32.0,
                ),
                Container(
                  child: Text('ActionChip: $_action'),
                  width: double.infinity,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.red,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip:${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      selectedColor: Colors.green,
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  height: 32.0,
                  color: Colors.orange,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip:$_choice'),
                ),
                Wrap(
                    spacing: 8.0,
                    children: _tags.map((tag) {
                      return ChoiceChip(
                        label: Text(tag),
                        selectedColor: Colors.green,
                        selected: _choice == tag,
                        onSelected: (value) {
                          setState(() {
                            _choice = tag;
                          });
                        },
                      );
                    }).toList()),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['apple', 'banana', 'lemon'];
            _selected = [];
            _choice = 'lemon';
          });
        },
      ),
    );
  }
}
