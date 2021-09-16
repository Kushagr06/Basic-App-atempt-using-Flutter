import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase/models//bro.dart';
import 'package:firebase/screens/home/bro_tile.dart';

class BroList extends StatefulWidget {

  @override
  _BroListState createState() => _BroListState();
}

class _BroListState extends State<BroList> {
  @override
  Widget build(BuildContext context) {
    final bros=Provider.of<List<Bro>>(context);

    return ListView.builder(
      itemCount: bros.length,
      itemBuilder: (context,index) {
        return BroTile(bro: bros[index]);
      },
    );
  }
}
