import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  /*
  1、Stream创建、监听数据变化：
  2、StreamController使用：pause、resume、cancel、add
  3、Sink使用：
  4、订阅多个控制器：
  5、StreamBuilder：动态改变widger
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';
  Future<String> _fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    //模拟错误发生，发生错误后，按下F5继续
    //throw 'Something happened.';
    return 'hello~';
  }

  void onData(String data) {
    print('onData:$data');
    setState(() {
      _data = data;
    });
  }

  void onDone() {
    print('Done.');
  }

  void onError(error) {
    print('onError:$error');
  }

  void _pauseStream() {
    print('Pause Stream.');
    _streamSubscription.pause();
  }

  void _cancelStream() {
    print('Cancel Stream.');
    _streamSubscription.cancel();
  }

  void _resumeStream() {
    print('Resume Stream.');
    _streamSubscription.resume();
  }

  void _addDataToStream() async {
    print('Add a data to stream.');
    String data = await _fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  void onDataTwo(String data) {
    print('onDataTwo:$data');
  }

  @override
  void initState() {
    super.initState();
    print('Create a stream.');
    //Stream<String> _streamDemo = Stream.fromFuture(_fetchData());
    //_streamDemo=StreamController<String>();//单个订阅的控制器
    _streamDemo = StreamController.broadcast(); //多个订阅的控制器
    _sinkDemo = _streamDemo.sink;
    print('Start listening on a stream.');
    _streamSubscription =
        _streamDemo.stream.listen(onData, onDone: onDone, onError: onError);
    _streamSubscription =
        _streamDemo.stream.listen(onDataTwo, onDone: onDone, onError: onError);

    print('Initialize completed.');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,
              initialData: '...',
              builder: (BuildContext context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
