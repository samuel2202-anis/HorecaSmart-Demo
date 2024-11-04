import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true; // Sign-in successful
    } catch (e) {
  
      return false; // Sign-in failed
    }
  }

  Future<bool> signUp(String email, String password, Map<String, dynamic> userData) async {
    try{
    UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection('users').doc(userCredential.user?.uid).set(userData);
  return true;
  }
  catch(e){
    return false;
  }
  }
}