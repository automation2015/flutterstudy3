import 'package:flutter/material.dart';

/*
1、重新定义主题颜色和样式: color: Theme.of(context).accentColor，ThemeData(primaryColor: Colors.black),//该方式完全替代之前的主题，Theme.of(context).copyWith(
              //该方式仅修改部分样式,如仅仅修改primaryColor，其他样式保持与主题样式一致；
2、TextField：
3、Form：TextFormField；key，使用key引用表单，获取表单数据；
*/
class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FormDemo'),
      elevation: 0.0,),
        body: Theme(
            //child: ThemeDemo(),
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //TextFieldDemo()
                  RegisterFormDemo()
                ],
              ),
            ),
            //data: ThemeData(primaryColor: Colors.black),//该方式完全替代之前的主题
            data: Theme.of(context).copyWith(
              //该方式仅修改部分样式,如仅仅修改primaryColor，其他样式保持与主题样式一致
              primaryColor: Colors.green,
            )));
  }
}

class RegisterFormDemo extends StatefulWidget {
  @override
  _RegisteDemoState createState() => _RegisteDemoState();
}

class _RegisteDemoState extends State<RegisterFormDemo> {
  String username, password;
  final registerFormKey = GlobalKey<FormState>();
  bool autovalidate = false;
  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }

  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  void submitRegisterForm() {
    if (registerFormKey.currentState.validate()) {
      registerFormKey.currentState.save();
      debugPrint('username:$username');
      debugPrint('password:$password');
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Registering...'),));
    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: validateUsername,//验证输入文本是否有效
            autovalidate: autovalidate,//自动校验，
            decoration: InputDecoration(labelText: 'Username',
             helperText: ''//自动校验的信息提示
             ),
             //保存表单数据时，执行回调，将表单数据保存给变量
            onSaved: (value) {
              username = value;
            },
          ),
          TextFormField(
            validator: validatePassword,
            autovalidate: autovalidate,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password', helperText: ''),
            onSaved: (value) {
              password = value;
            },
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
              width: double.infinity,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                onPressed: submitRegisterForm,
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 0.0,
              ))
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input:${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value) {
      //   debugPrint('input:$value');
      // },
      onSubmitted: (value) {
        debugPrint('submitter:$value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter post title.',
        filled: true, //设置文本框内部是否填充颜色
        fillColor: Colors.green, //设置文本框内部填充的颜色
        // border: InputBorder.none,//默认文本框下边有一条边线，通过该命令可以不显示边线
        //border: OutlineInputBorder(),//设置文本框四周都有边框
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Theme.of(context).primaryColor,
      color: Theme.of(context).accentColor,
      child: Container(),
    );
  }
}
