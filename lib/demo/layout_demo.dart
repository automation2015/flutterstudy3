import 'package:flutter/material.dart';

/*
1、IconBagde
2、Row Column:FlaxBox,主轴mainAxisAlignment，交叉轴crossAxisAlignment；
3、Sizedebox:
4、Stack；
5、渐变；
6、Positioned小部件，可以设置在父容器中的位置；
7、AspectRatio小部件，可以指定宽高比；
8、Constrained小部件，可以限定高度和宽度值；
*/
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatioDemo();
  }
}
class ConstrainedBoxDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) { 
    return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //
      ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 200.0,minWidth: 300.0),
        child: Container(color: Colors.blue,),)
        
      ],),);
  }
}
class AspectRatioDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      AspectRatio(
        aspectRatio: 16.0/9.0,
        child: Container(color: Colors.blue,),)
    ],),);
  }

}

class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //alignment: Alignment.center,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
    Stack(
      alignment: Alignment.centerLeft, 
    children: <Widget>[ 
      SizedBox(
        width: 200.0,
        height: 200.0,
        child: Container(
          alignment: Alignment(0.0, -1.0), //设置子部件在父容器中的位置，可以是数字也可以是参数
          child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
          decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0)),
        ),
        
      ),
      SizedBox(
        height: 100.0,
      ),
      SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                // borderRadius: BorderRadius.circular(8.0)),
                //5、设置渐变：镜像渐变、线性渐变
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 54, 255, 1.0),
                ])),
            child: Icon(Icons.brightness_2, size: 32.0, color: Colors.white),
          )),
           //6、Positioned小部件
           Positioned(
            top: 100.0,
            right: 20,
            child: Icon(Icons.ac_unit,color:Colors.white),
          ),
          Positioned(
            bottom: 40.0,
            right: 20,
           child: Icon(Icons.ac_unit,color:Colors.white),
          ),
          Positioned(
            right: 50.0,
            top: 20,
           child: Icon(Icons.ac_unit,color:Colors.white),          
          ),
          Positioned(
            right: 60.0,
            top: 60,
           child: Icon(Icons.ac_unit,color:Colors.white),
           
          ),
    ])],));
  }
}

class SizedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(            
            width: 200.0,
            height: 200.0,
            child: Container(
              alignment: Alignment(0.0, -1.0), //设置子部件在父容器中的位置，可以是数字也可以是参数
              child: Icon(Icons.ac_unit, color: Colors.white, size: 32.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  borderRadius: BorderRadius.circular(8.0)),
             // child: Icon(Icons.brightness_2, size: 32.0, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class RowOrColumnDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconBadge(Icons.pool, size: 32.0),
          IconBadge(Icons.beach_access, size: 32.0),
          IconBadge(Icons.airplanemode_active, size: 32.0),
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon, {this.size});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
