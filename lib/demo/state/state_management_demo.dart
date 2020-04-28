import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('StateManagementDemo'),
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
                child: Icon(Icons.add), onPressed: model.increatCount),         
        ),
      ),
    );
    /*//CounterProvider方式为小部件提供数据
    CounterProvider(
      count: _count,
      increatCounter: _increaseCount,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('StateManagementDemo'),
        ),
        body: CounterWrapper(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _increaseCount,
        ),
      ),
    );
*/
  }
}

class CounterWrapper extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;
  // CounterWrapper(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;
  // Counter(this.count, this.increaseCount);
  @override
  Widget build(BuildContext context) {
  
    return ScopedModelDescendant<CounterModel>(builder: (context,_,model)=>ActionChip(
      label: Text('${model.count}'),
      onPressed: model.increatCount,
    ));
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increatCounter;
  final Widget child;
  CounterProvider({this.child, this.count, this.increatCounter})
      : super(child: child);
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increatCount() {
    _count += 1;
    notifyListeners();
  }
}
