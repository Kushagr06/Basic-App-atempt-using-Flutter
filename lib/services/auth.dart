import 'package:firebase/models/user.dart';
import 'package:firebase/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{

  final FirebaseAuth _auth= FirebaseAuth.instance;

  //create a user object based on FireBase user
  User? _userFromFirebaseUser(FirebaseUser user){
  return user!= null ? User(uid: user.uid) : null;
  }


  //auth change user stream
  Stream<User> get user{
    .map(_userFromFirebaseUser);
    return _auth.onAuthStateChanged;

  }

  //sign in anon
Future signInAnon() async{
  try{
    AuthResult result =await _auth.signInAnonymously();
    FirebaseUser user=result.user;
    return _userFromFirebaseUser(user);
  }

  catch(e){
    print(e.toString());
    return null;
  }
}

  //sign in with email and password
  Future signInWithEmailAndPassword(String email,String password) async{
    try{
      AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //register with email and password
  Future registerWithEmailAndPassword(String email,String password) async{
    try{
   AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
   FirebaseUser user=result.user;

   //create a new document for the user with uid
   await DatabaseService(uid:user.uid).updateUserData('new crew member',100);
   return _userFromFirebaseUser(user);
    }catch(e){
     print(e.toString());
     return null;
    }
  }

  //sign out
Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
}
}