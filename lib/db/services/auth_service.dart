import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthException implements Exception {
  String message;
  AuthException(this.message);
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? usuario;
  bool isLoading = false;

  AuthService() {
    _authCheck();
  }

  _authCheck() {
    print(_auth.currentUser?.email);
    _auth.authStateChanges().listen((User? user) {
      usuario = user;
      isLoading = false;
      notifyListeners();
    });
  }

  _getUser() {
    usuario = _auth.currentUser;
    notifyListeners();
  }

  registrar(String email, String senha) async {
    try {
      var credentials = await _auth.createUserWithEmailAndPassword(
          email: email, password: senha);
      _getUser();
      return credentials.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException('A senha é muito fraca');
      } else if (e.code == 'email-already-in-use') {
        throw AuthException('O email já está em uso');
      }
    }
  }

  login(String email, String senha) async {
    try {
      var credential =
          await _auth.signInWithEmailAndPassword(email: email, password: senha);
      _getUser();
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AuthException('Email não encontrado. Cadastre-se');
      } else if (e.code == 'wrong-password') {
        throw AuthException('Senha incorreta. Tente novamente');
      } else if (e.code == 'invalid-email') {
        throw AuthException('Por favor, insira um email válido!');
      }
      throw AuthException(
          'Ocorreu um erro inexperado. Por favor, tente novamente.');
    }
  }

  logout() {
    _auth.signOut();
    _getUser();
  }
}
