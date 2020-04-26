import 'package:flutter/material.dart';
class ButtonDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final  Widget flatButtonDemo= Row(
  mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Button'),
                onPressed: (){
                },
                splashColor: Colors.grey,
                textColor: Theme.of(context).accentColor,
              ),
              FlatButton.icon(onPressed: (){},
               icon: Icon(Icons.add), label: Text('Button'),textColor: Theme.of(context).accentColor,)

            ],);
    final Widget raisedButtonDemo=Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //使用Theme延续主界面的theme设置，可以部分修改
             Theme(
               //data:ThemeData(),
               data:Theme.of(context).copyWith(//部分修改theme
                 buttonColor:Theme.of(context).accentColor,
                 buttonTheme: ButtonThemeData(
                   textTheme: ButtonTextTheme.primary,
                  // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.0))//斜角矩形形状
                  shape: StadiumBorder(),//橄榄球场形状
                  )
               ),
               child:  RaisedButton(
                child: Text('Button'),
                onPressed: (){},
                splashColor: Colors.grey,
                //color: Theme.of(context).accentColor,
                elevation: 0.0,
                //textColor: Theme.of(context).primaryColor,
                textTheme: ButtonTextTheme.primary,
              ),),
              SizedBox(width: 16.0,),
             RaisedButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                elevation: 20.0,
                //textColor: Theme.of(context).primaryColor,
                textTheme: ButtonTextTheme.primary,)

            ],);
    final Widget outlineButtonDemo= Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //使用Theme延续主界面的theme设置，可以部分修改
             Theme(
               //data:ThemeData(),
               data:Theme.of(context).copyWith(//部分修改theme
                 buttonColor:Theme.of(context).accentColor,
                 buttonTheme: ButtonThemeData(
                   textTheme: ButtonTextTheme.primary,
                  // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(5.0))//斜角矩形形状
                  shape: StadiumBorder(),//橄榄球场形状
                  )
               ),
               child:  OutlineButton(
                child: Text('Button'),
                onPressed: (){},
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                //color: Theme.of(context).accentColor,
                highlightColor: Colors.grey,
                //textColor: Theme.of(context).primaryColor,
                textTheme: ButtonTextTheme.primary,
              ),),
              SizedBox(width: 16.0,),
             OutlineButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                borderSide: BorderSide(color: Colors.black),
                highlightColor: Colors.grey,
                textColor: Colors.black)
                //textTheme: ButtonTextTheme.primary,)

            ],);
   final Widget fixedWidthButtonDemo= Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[          
            Container(width: 160.0,
            child:  OutlineButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                borderSide: BorderSide(color: Colors.black),
                highlightColor: Colors.grey,
                textColor: Colors.black,),)
                //textTheme: ButtonTextTheme.primary,)
            ],);
    final Widget expandedButtonDemo=Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[          
            Expanded(
            child:  OutlineButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                borderSide: BorderSide(color: Colors.black),
                highlightColor: Colors.grey,
                textColor: Colors.black,),),
                SizedBox(width: 16.0,),
                 Expanded(
                   //flex:设置部件所占比重
                   flex: 2,
            child:  OutlineButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                borderSide: BorderSide(color: Colors.black),
                highlightColor: Colors.grey,
                textColor: Colors.black,),)
                //textTheme: ButtonTextTheme.primary,)
            ],);
    final Widget buttonBarDemo= Row(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[  
              Theme(
                data: Theme.of(context).copyWith(
                  buttonTheme:ButtonThemeData(padding: EdgeInsets.symmetric(horizontal:32.0))
                ),
                child:ButtonBar(children: <Widget>[
              OutlineButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                borderSide: BorderSide(color: Colors.black),
                highlightColor: Colors.grey,
                textColor: Colors.black,),
                OutlineButton.icon(onPressed: (){},
               icon: Icon(Icons.add), 
               label: Text('Button'),
                color: Theme.of(context).accentColor,
                borderSide: BorderSide(color: Colors.black),
                highlightColor: Colors.grey,
                textColor: Colors.black,),
                ],
                )
                )
                //textTheme: ButtonTextTheme.primary,)
            ],);
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body:Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           flatButtonDemo,
           raisedButtonDemo,
           outlineButtonDemo,
           fixedWidthButtonDemo,
           expandedButtonDemo,
           buttonBarDemo
          ],
        ),)
    );
  }
}