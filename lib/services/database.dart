import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/models/bro.dart';
class DatabaseService{

  final  String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference broCollection=Firestore.instance.collection('bros');

  Future updateUserData(String name,int strength) async{
    return await broCollection.document(uid).setData({
      'name':name,
      'strength':strength,
    });
  }

  //bro list from snapshot
  List<Bro> _broListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Bro(
        name:doc.data['name'] ?? '',
        strength: doc.data['strength']?? 0
      );
    }).toList();
  }
 //get bros stream
Stream<List<Bro>> get bros{
    return broCollection.snapshots()
    .map(_broListFromSnapshot);
}
}