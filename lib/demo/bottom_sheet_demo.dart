import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

enum Options { A, B, C }

class BottomSheetDemo extends StatefulWidget {
  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  String _option = 'Nothing';
  Future _openModalBottemSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text('Option A'),
                    onTap: () {
                      Navigator.pop(context, Options.A);
                    },
                  ),
                  ListTile(
                    title: Text('Option B'),
                    onTap: () {
                      Navigator.pop(context, Options.B);
                    },
                  ),
                  ListTile(
                    title: Text('Option C'),
                    onTap: () {
                      Navigator.pop(context, Options.C);
                    },
                  ),
                ],
              ));
        });
    switch (option) {
      case Options.A:
        setState(() {
          _option = 'A';
        });
        break;
        case Options.B:
        setState(() {
          _option = 'B';
        });
        break;
        case Options.C:
        setState(() {
          _option = 'C';
        });
        break;
    }
  }

  _openBottemSheet() {
    _bottomSheetScaffoldKey.currentState
        .showBottomSheet((BuildContext context) {
      return BottomAppBar(
        //可以返回任意Widget，仅做演示
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text('aaaaaaaaaaaaaa'),
              Expanded(
                child: Text(
                  'BBBBBBBBBBBBBBBBB',
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Your option is: $_option'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Open BottomSheet'),
                  onPressed: _openBottemSheet,
                ),
                FlatButton(
                  child: Text('Modal BottomSheet'),
                  onPressed: _openModalBottemSheet,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
