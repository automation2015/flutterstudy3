import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource {
  final List<Post> _posts = posts;
  int _selectedCount = 0;
  @override
  int get rowCount => _posts.length;
  @override
  bool get isRowCountApproximate => false;
  //获取选中行数执行selectedRowCount
  @override
  int get selectedRowCount => _selectedCount;
  //返回每一行的具体内容
  @override
  DataRow getRow(int index) {
    final Post post = posts[index];
    return DataRow.byIndex(
      index: index, 
      cells: <DataCell>[
      DataCell(Text(post.title)),
      DataCell(Text(post.author)),
      DataCell(Image.network(post.imageUrl)),
    ]);
  }
  void _sort(getField(post),bool ascending){
    _posts.sort((a,b){
      if(!ascending){
        final c=a;
        a=b;
        b=c;
      }
      final aValue=getField(a);
      final bValue=getField(b);
      return Comparable.compare(aValue, bValue);
         });
         notifyListeners();
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex;
  bool _sortAscending = false;
  final PostDataSource _postsDataSource = PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PaginatedDataTable'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              PaginatedDataTable(
                header: Text('Posts'),
                rowsPerPage: 5,//每页显示的行数
                source: _postsDataSource,
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                columns: [
                  DataColumn(
                      label: Text('Title'),
                      onSort: (int columnIndex, bool ascending) {
                        _postsDataSource._sort((post)=>post.title.length,ascending);
                        setState(() {
                          _sortColumnIndex = columnIndex;
                          _sortAscending = ascending;
                        });
                        
                      }),
                  DataColumn(label: Text('Author')),
                  DataColumn(label: Text('Image')),
                ],
              )
            ],
          ),
        ));
  }
}
