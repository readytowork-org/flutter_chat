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
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return "Please enter a valid email address";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Username")),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return "Please enter username greater than 5 charachers";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Password")),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 7) {
                      return "Please enter password greater than 7 charachers";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(onPressed: () {}, child: const Text("Login")),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Create new account",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
