import 'package:flutter/material.dart';
import 'package:flutterstudy3/demo/alert_dialog_demo.dart';
import 'package:flutterstudy3/demo/basic_demo.dart';
import 'package:flutterstudy3/demo/bottom_sheet_demo.dart';
import 'package:flutterstudy3/demo/navigator_demo.dart';
import 'package:flutterstudy3/demo/snack_bar_demo.dart';
import 'model/post.dart';
import 'demo/listview_demo.dart';
import 'demo/hello_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_componets.dart';
import 'demo/simple_dialog_demo.dart';
import 'demo/snack_bar_demo.dart';
import 'demo/expansion_panel_demo.dart';
/*1、TabBar：需要TabController+TabBar+TabBarView
  2、设置TabBar的样式
  3、设置TabBar选中时的状态：高亮颜色和水波纹
  4、Drawer:Drawer、DrawerHeader、onTap、UserAccountsDrawerHeader、bottomNavigationBar
    */
void main()=>runApp(App());
class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/expansionPanel',
      routes: {
        '/':(context)=>Home(),
        '/about':(context)=>Page(title:'About'),
        '/form':(context)=>FormDemo(),
        '/mdc':(context)=>MaterialComponents(),
        '/simpledialog':(context)=>SimpleDialogDemo(),
        '/alertDialog':(context)=>AlertDialogDemo(),
        '/bottomSheet':(context)=>BottomSheetDemo(),
        '/snackBar':(context)=>SnackBarDemo(),
        '/expansionPanel':(context)=>ExpansionPanelDemo()
      },
      //设置右上角debug标识
      debugShowCheckedModeBanner: false,
      //home:Home(),
      //home: NavigatorDemo(),
        theme: ThemeData(
          primaryColor: Colors.yellow,
          //3、设置TabBar选中时的状态：高亮颜色和水波纹
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70),
    ); 
  }
}
class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    //1、TabBar：需要TabController+TabBar+TabBarView
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          //默认添加的leading可以直接打开drawer
          // leading: IconButton(
          //   icon: Icon(Icons.menu),onPressed: ()=>debugPrint('Leading iconButton is pressed.'),),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),onPressed: ()=>debugPrint('Actions iconButton is pressed.'),)
          ],
          title: Text('NINGHAO'),
          //设置appBar的阴影大小
          elevation: 30.0,
          bottom: TabBar(
            //2、设置TabBar的样式
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,//默认值TabBarIndicatorSize.tab
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist),),
              Tab(icon: Icon(Icons.change_history),),
              Tab(icon: Icon(Icons.directions_bike),),
              Tab(icon: Icon(Icons.view_list),)
            ],),),
        //body:Hello(),
        body:TabBarView(
          children: <Widget>[
            ListViewDemo(),
            //Icon(Icons.local_florist,size: 128.0,color: Colors.grey,),
            BasicDemo(),
            //Icon(Icons.change_history,size: 128.0,color: Colors.grey,),
            LayoutDemo(),
            //Icon(Icons.directions_bike,size: 128.0,color: Colors.grey,),
            //Icon(Icons.directions_boat,size: 128.0,color: Colors.grey,),
            ViewDemo()
            //SliverDemo()

          ],),
        drawer:Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                /*
                DrawerHeader(
                  child: Text('header'.toUpperCase()),
                  decoration: BoxDecoration(
                    color:Colors.grey[100] ),
                ),*/
                UserAccountsDrawerHeader(accountName: Text('wanghao',style: TextStyle(fontWeight: FontWeight.bold),),
                accountEmail: Text('wanghao@ninghao.net'),
                currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
                ),
                decoration: BoxDecoration(
                  color:Colors.yellow,
                  image:DecorationImage(
                    fit:BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.yellow, BlendMode.hardLight),
                    image:NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg') ) ,
                ),),
                ListTile(
                  title:Text('Message',textAlign: TextAlign.right,),
                  leading:Icon(Icons.message,color: Colors.black12,size: 22.0,),
                  trailing: Icon(Icons.message,color: Colors.black12,size: 22.0,) ,
                  onTap: ()=>Navigator.pop(context),//点击菜单项收起drawer
                  ),
                   ListTile(
                  title:Text('Setting',textAlign: TextAlign.right,),
                  leading:Icon(Icons.settings_cell,color: Colors.black12,size: 22.0,),
                  trailing: Icon(Icons.settings_overscan,color: Colors.black12,size: 22.0,) ,
                  onTap: ()=>Navigator.pop(context),//点击菜单项收起drawer
                  ),
                   ListTile(
                  title:Text('Other',textAlign: TextAlign.right,),
                  leading:Icon(Icons.settings_input_component,color: Colors.black12,size: 22.0,),
                  trailing: Icon(Icons.settings_input_antenna,color: Colors.black12,size: 22.0,) ,
                  onTap: ()=>Navigator.pop(context),//点击菜单项收起drawer
                  ),

              ],),) ,//左边drawer
        endDrawer: Container(
            padding: EdgeInsets.all(8.0),
            color: Colors.white70,
            child: Text('This is left drawer') ,),//右边drawer   
         bottomNavigationBar:BottomNavigationBarDemo()
          ));
  }
}
