import 'package:firebase/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase/services/auth.dart';
import 'package:firebase/shared/constants.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth =AuthService();
  final _formKey=GlobalKey<FormState>();
  bool loading=false;

  //text field state
  String email='';
  String password='';
  String error='';
  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        elevation:0.0,
        title:Text('Sign Up to App'),

        actions:<Widget>[
          FlatButton.icon(
              icon:Icon(Icons.person),
              label:Text('SignIn'),
              onPressed:(){
                widget.toggleView();
              }
          )
        ],
      ),
      body:Container(
        padding:EdgeInsets.symmetric(vertical:20.0, horizontal:50.0),
        child:Form(
          key: _formKey,
          child:Column(
            children:<Widget>[
              SizedBox(height:20.0),
              TextFormField(
                  decoration: textInputDecoration.copyWith(hintText:'Email'),
                validator: (val) =>val.isEmpty ? 'Enter and email': null,
                  onChanged: (val){
                    setState(()=>email=val);
                  }
              ),
              SizedBox(height:20.0),
              TextFormField(
                  decoration:textInputDecoration.copyWith(hintText:'Password'),
                    hintText:'Password',
                  ),
                  obscureText: true,
                  validator: (val) =>val.length <6 ? 'Password should be atleast 6 letters': null,
                  onChanged:(val){
                    setState(()=>password=val);
                  }
              ),
              SizedBox(height:20.0),
              RaisedButton(
                  color:Colors.pink[400],
                  child:Text(
                    'Sign Up',
                    style: TextStyle(color:Colors.white),
                  ),
                  onPressed: () async{
                   if(_formKey.currentState.validate()){
                     setState(()=>loading=true);
                     dynamic result= await _auth.registerWithEmailAndPassword(email, password);
                   if(result == null){
                     setState((){
                       error="Invalid";
                       loading=false;
                     });
                     }
                   }
                   }
                  }
              ),
              SizedBox(height:12.0),
              Text(
                error,
                style:TextStyle(color:Colors.red,fontSize:14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
