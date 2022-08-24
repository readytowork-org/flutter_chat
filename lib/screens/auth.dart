import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email,
    String username,
    String password,
    bool isLogin,
  ) async {
    UserCredential _authResult;
    try {
      if (isLogin) {
        _authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        _authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (error) {
      var message = "An error occured, please check your credentials !";

      if (error.message != null) {
        message = error.message!;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Item added to your cart."),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: AuthForm(_submitAuthForm),
    );
  }
}
