import 'package:firebase_auth/firebase_auth.dart';
import 'package:tubes_moprokel8/Database/databasemanager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // registration with email and password

  Future createNewUser(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      await DatabaseManager().createUserData(name, user.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

// sign with email and password

  Future loginUser(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

// signout

  Future<dynamic> signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

class CrudMethods {
  Future<void> addData(item) async {
    print(item);
    FirebaseFirestore.instance
        .collection('newsdata')
        .add(item)
        .then((value) => print(value))
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    FirebaseFirestore.instance.collection('newsdata').get();
  }
}

class CrudMethods2 {
  Future<void> addData(item) async {
    print(item);
    FirebaseFirestore.instance
        .collection('kuliner')
        .add(item)
        .then((value) => print(value))
        .catchError((e) {
      print(e);
    });
  }

  getData() async {
    FirebaseFirestore.instance.collection('kuliner').get();
  }
}
