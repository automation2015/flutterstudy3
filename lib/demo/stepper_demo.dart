import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('StepperDemo'),elevation: 0.0,),
      body:Container(padding: EdgeInsets.all(16.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(data:Theme.of(context).copyWith(
          primaryColor:Colors.black,         
        ),
        child: Stepper(
          onStepContinue: (){
            setState(() {
              _currentStep<2 ? _currentStep+=1: _currentStep=0;
            });
          },
          onStepCancel: (){
            setState(() {
              _currentStep>0?_currentStep-=1:_currentStep=0;
            });
          },
          onStepTapped: (value){
            setState(() {
              _currentStep=value;

            });
          },
          currentStep: _currentStep,
          steps: [
          Step(title: Text('Login'),
          subtitle: Text('Login first'),
          content: Text('Labore commodo irure adipisicing voluptate sit labore ad officia cupidatat.'),
          isActive: _currentStep==0),
          Step(title: Text('Choose Plan'),
          subtitle: Text('Choose you plan'),
          content: Text('Voluptate adipisicing aute aliqua consequat laborum officia pariatur labore pariatur enim Lorem ad.'),
          isActive: _currentStep==1),
          Step(title: Text('Confirm payment'),
          subtitle: Text('Confirm your payment method'),
          content: Text('Eiusmod et pariatur excepteur excepteur ullamco quis.'),
          isActive: _currentStep==2),
          
        ],),
        )
      ],),)
    );
  }
}