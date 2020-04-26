import 'package:flutter/material.dart';
/*
1、重新定义主题颜色和样式
*/
class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Theme(         
      //child: ThemeDemo(),
      child: Container(padding: EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFieldDemo()
      ],),),
      //data: ThemeData(primaryColor: Colors.black),//该方式完全替代之前的主题
      data:Theme.of(context).copyWith(//该方式仅修改部分样式
        primaryColor:Colors.green,
      )
    ));
  }
}


class TextFieldDemo extends StatefulWidget {
 
 
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
   final textEditingController=TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
    
  }
  @override
  void initState() { 
    super.initState();
    textEditingController.text='hi';
  }
  @override
  Widget build(BuildContext context) {
    return 
         TextField(
           controller: textEditingController,
           onChanged: (value){
             debugPrint('input:$value');
           },
           onSubmitted: (value){
             debugPrint('submitter:$value');
           },
           decoration: InputDecoration(
             filled: true,
            fillColor: Colors.blue,
            // border: InputBorder.none,
            border: OutlineInputBorder(),
             labelText: 'Title',
             hintText: 'Enter post title.'),            
         );
  }
}
class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Theme.of(context).primaryColor,
      color:Theme.of(context).accentColor,
      child: Container(),
    );
  }
}