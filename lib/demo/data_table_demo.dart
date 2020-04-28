import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DataTableDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(children: <Widget>[
            DataTable(
                sortColumnIndex: _sortColumnIndex,//排序栏的索引号，界面出现小箭头
                sortAscending: _sortAscending,//true：升序排列
                onSelectAll: (bool value) {
                
                },
                columns: [
                  DataColumn(
                     label: Text('Title'),
                     //label:Container(width: 150.0,child: Text('Title'),),//设置不同宽度单元格
                      onSort: (int index, bool ascending) {
                        setState(() {
                          _sortColumnIndex = index;
                          _sortAscending = ascending;

                          posts.sort((a, b) {
                            if (!ascending) {
                              final c = a;
                              a = b;
                              b = c;
                            }
                            return a.title.length.compareTo(b.title.length);
                          });
                        });
                      }),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('Image')),
                ],
                rows: posts.map((post) {
                  return DataRow(
                      selected: post.selected,
                      onSelectChanged: (bool value) {
                        setState(() {
                          if (post.selected != value) post.selected = value;
                        });
                      },
                      cells: [
                        DataCell(Text(post.title)),
                        DataCell(Text(post.author)),
                        DataCell(Image.network(post.imageUrl))
                      ]);
                }).toList())

            /*
        [
          DataRow(cells: [
            DataCell(Text('name')),
            DataCell(Text('guojing')),
          ]),
           DataRow(cells: [
            DataCell(Text('price')),
            DataCell(Text('20000')),
          ]), 
          DataRow(cells: [
            DataCell(Text('unit')),
            DataCell(Text('kg')),
          ])
          
        ]
        */
          ]),
        ));
  }
}
