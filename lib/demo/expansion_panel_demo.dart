import 'package:flutter/material.dart';
class ExpansionPanelItem{
  final String headerText;
  final Widget body;
  bool isExpanded;
  ExpansionPanelItem({this.headerText,this.body,this.isExpanded});
}

class ExpansionPanelDemo extends StatefulWidget {
  
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool _isExpanded=false;
  List<ExpansionPanelItem> _expansionPanelItem;
  @override
  void initState() {
    super.initState();
    _expansionPanelItem=<ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        isExpanded: false,
      body:Container(child: Text('Content is panel A.'),padding:EdgeInsets.all(16.0),
      width: double.infinity,)
      ),
      
      ExpansionPanelItem(
        headerText: 'Panel B',
        isExpanded: false,
      body:Container(child: Text('Content is panel B.'),padding:EdgeInsets.all(16.0),
      width: double.infinity,)
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        isExpanded: false,
      body:Container(child: Text('Content is panel C.'),padding:EdgeInsets.all(16.0),
      width: double.infinity,)
      ),
      
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExpansionPanelDemo'),elevation: 0.0,),
      body: Container(padding: EdgeInsets.all(16.0),child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
         
            ExpansionPanelList(
              expansionCallback: (int panelIndex,bool isExpanded){
                setState(() {
                  _isExpanded=!isExpanded;
                });
              },
              children: [
              
              ExpansionPanel(headerBuilder: (BuildContext context,bool isExpanded){
                return Container(padding: EdgeInsets.all(16.0),
                child: Text('Panel A',style: Theme.of(context).textTheme.title,),);

              },
              body: Container(padding: EdgeInsets.all(16.0),child: Text('Content for panel A',style: Theme.of(context).textTheme.subtitle,),),
              isExpanded: _isExpanded,
              )
            
          ],)
        ],),),
    );
  }
}