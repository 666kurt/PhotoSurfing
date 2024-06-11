// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Метод входа пользователя
  Future<User?> signIn(String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception('Error signing with email and password');
    }
  }

  // Метод регистрации пользователя
  Future<User?> signUp(String email, password, login) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Обращение к БД
      // _firestore.collection("Users").doc(userCredential.user!.uid).set(
      //   {
      //     'uid': userCredential.user!.uid,
      //     'email': email,
      //     'login': login,
      //      ....
      //   },
      // );
      return userCredential.user;
    } catch (e) {
      throw Exception('Error signing with email and password');
    }
  }

  // Метод выхода пользователя
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Геттер для получения информации о состоянии аутентификации
  Stream<User?> get user => _auth.authStateChanges();
}
