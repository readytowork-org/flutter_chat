import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min, //take only space as it needs
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text("Email"),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Username")),
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Password")),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                TextButton(onPressed: (){}, child: const Text("Create new account"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
