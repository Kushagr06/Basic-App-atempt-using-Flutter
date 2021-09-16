import 'package:flutter/material.dart';
import'package:firebase/models/bro.dart';

class BroTile extends StatelessWidget {

  final Bro bro;
  BroTile({this.bro});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(top:8.0),
      child:Card(
        margin:EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child:ListTile(
          leading:CircleAvatar(
            radius:25.0,
            backgroundColor:Colors.pink[bro.strength],
          ),
          title:Text(bro.name),
        ),
      )
    );
  }
}
