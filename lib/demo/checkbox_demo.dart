import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class CheckBoxDemo extends StatefulWidget {
  /*
  1、CheckBox：
  2、CheckboxListTile：
  3、Radio
  4、RadioListTile
  5、Switch：
  6、SwitchListTile：
  7、Slider：
  8、日期时间：
  9、package:intl/intl.dart安装：异步处理

  */
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkboxItemA = true;
  bool _switchItemA = false;
  int _radioGroupA = 0;
  //7、Slider：
  double _sliderItemA = 0.0;
  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  //8、日期
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectTime=TimeOfDay(hour: 9,minute: 30);
  Future<void> _selectDate() async {
    final DateTime date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (date == null) return;
    setState(() {
      selectedDate = date;
    });
  }
  Future<void> _selectTime()async{
    final TimeOfDay time=await showTimePicker(context: context, initialTime: selectTime);
    if(time == null ) return;
    setState(() {
      selectTime=time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBoxDemo'),
          elevation: 0.0,
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //4、RadioListTile
              Text('RadioGroupValue: $_radioGroupA'),
              SizedBox(
                height: 32.0,
              ),
              RadioListTile(
                value: 0,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged,
                title: Text('Option A'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_1),
                selected: _radioGroupA == 0,
              ),
              RadioListTile(
                value: 1,
                groupValue: _radioGroupA,
                onChanged: _handleRadioValueChanged,
                title: Text('Option B'),
                subtitle: Text('Description'),
                secondary: Icon(Icons.filter_2),
                selected: _radioGroupA == 1,
              ),
              //2、CheckboxListTile：
              CheckboxListTile(
                value: _checkboxItemA,
                onChanged: (value) {
                  setState(() {
                    _checkboxItemA = value;
                  });
                },
                title: Text('Check box item A'),
                subtitle: Text('Describe'),
                selected: _checkboxItemA,
                secondary: Icon(Icons.add_call),
              ),
              //6、SwitchListTile：
              SwitchListTile(
                  value: _switchItemA,
                  onChanged: (value) {
                    setState(() {
                      _switchItemA = value;
                    });
                  },
                  title: Text('Switch item A'),
                  subtitle: Text('Description'),
                  selected: _switchItemA,
                  secondary: Icon(
                      _switchItemA ? Icons.visibility : Icons.visibility_off)),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //1、CheckBox：
                    Checkbox(
                        activeColor: Colors.red,
                        value: _checkboxItemA,
                        onChanged: (value) {
                          setState(() {
                            _checkboxItemA = value;
                          });
                        })
                  ]),
              //3、Radio
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: _radioGroupA,
                      onChanged: _handleRadioValueChanged,
                      activeColor: Colors.red,
                    ),
                    Radio(
                      value: 1,
                      groupValue: _radioGroupA,
                      onChanged: _handleRadioValueChanged,
                      activeColor: Colors.red,
                    )
                  ]),
              //5、Switch：
              // Row(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: <Widget>[
              //       Text(
              //         _switchItemA ? 'smile' : 'cry',
              //         style: TextStyle(fontSize: 32.0),
              //       ),
              //       Switch(
              //         onChanged: (value) {
              //           setState(() {
              //             _switchItemA = value;
              //           });
              //         },
              //         value: _switchItemA,
              //       )
              //     ]),
              //8、日期时间
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: _selectDate,
                    child: Row(
                      children: <Widget>[
                        Text(
                          DateFormat.yMMMMd().format(selectedDate),
                          style: TextStyle(fontSize: 32.0),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  InkWell(onTap: _selectTime,
                  child: Row(children: <Widget>[
                    Text(selectTime.format(context),style: TextStyle(fontSize: 32.0,color: Colors.red)),
                    Icon(Icons.arrow_drop_down)
                  ],),)
                ],
              ),

              /*
              7、Slider：
                  Row(
                    children: <Widget>[
                  Slider(
                    value: _sliderItemA,
                    onChanged: (value) {
                      setState(() {
                        _sliderItemA = value;
                      });
                    },
                    activeColor: Theme.of(context).accentColor,
                    inactiveColor:
                        Theme.of(context).accentColor.withOpacity(0.3),
                    min: 0.0,
                    max: 10.0,
                    divisions: 10,
                    label: '${_sliderItemA.toInt()}',
                  )],),
                */

              SizedBox(
                height: 32.0,
              ),
              Text('SliderValue: $_sliderItemA')
            ],
          ),
        ));
    ;
  }
}
