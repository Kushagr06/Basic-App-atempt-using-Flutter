import 'package:flutter/material.dart';
import 'package:firebase/shared/constants.dart';
import 'package:flutter/services.dart';

class SettingsForm extends StatefulWidget {

  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey= GlobalKey<FormState>();

  //form values
  String _currentName;
  int _currentStrength;
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_formKey,
      child:Column(
        children: <Widget>[
          Text(
            'Update your Settings:',
            style:TextStyle(fontSize:18.0),
          ),
          SizedBox(height:20.0),
          TextFormField(
            decoration:textInputDecoration,
            validator: (val)=>val.isEmpty ? 'Enter a Name:':null,
            onChanged:(val)=>setState(()=>_currentName=val),
          ),
          SizedBox(height:20.0),
          Slider(
            value: (_currentStrength ?? 100).toDouble(),
            activeColor: Colors.orange[_currentStrength ?? 100],
            inactiveColor: Colors.orange[_currentStrength ?? 100],
            min:100,
            max:900,
           divisions: 8,
           onChanged: (val)=> setState(()=>_currentStrength=val.round()),
          ),
          //slider
          RaisedButton(
            color:Colors.pink,
            child:Text(
              'Update',
              style:TextStyle(color:Colors.white),
            ),
            onPressed: () async{
              print(_currentName);
              print(_currentStrength);
            }
          ),
        ],
      ),
    );
  }
}
