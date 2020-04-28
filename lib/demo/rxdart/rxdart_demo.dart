import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class RxDartDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RxDartDemoHome();
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFileldSubject;
  @override
  void initState() {
    super.initState();
    //Observable在最新版本0.24.0中没有，在0.18.1中有
    // Observable<String> _observabl =
    //  Observable(Stream.fromIterable(['elements','hello','hi']));
// Observable.fromFuture(Future.value('hello,future'));
    // Observable.fromIterable(['elements', 'hello', 'hi']);
    //Observable.just('Hello just');
    //Observable.periodic(Duration(seconds: 3),(x)=>x.toString());
    //_observabl.listen(print);
    //PublishSubject<String> _subject=PublishSubject<String>();
    //BehaviorSubject<String> _subject=BehaviorSubject<String>();
    //ReplaySubject<String> _subject=ReplaySubject<String>(maxSize: 2);
    //_subject.add('hello');
    //_subject.add('hello 22222');
    //_subject.listen((data)=>print('listen 1: $data'));
    //_subject.listen((data)=>print('listen 2: ${data.toUpperCase()}'));
    //_subject.close();
    _textFileldSubject = PublishSubject<String>();
    _textFileldSubject
    //.map((item)=>'item:$item')
    //.where((item)=>item.length > 9)
    .debounce((Duration(milliseconds: 500)))
    .listen((data) => print(data));
  }

  @override
  void dispose() {
    _textFileldSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('RxDartDemo'),
          elevation: 0.0,
        ),
        body: Theme(
          data: Theme.of(context).copyWith(primaryColor: Colors.black),
          child: TextField(
            onChanged: (value) {
              _textFileldSubject.add('input: $value');
            },
            onSubmitted: (value) {
              _textFileldSubject.add('submit: $value');
            },
            decoration: InputDecoration(labelText: 'Title', filled: true),
          ),
        ));
  }
}
