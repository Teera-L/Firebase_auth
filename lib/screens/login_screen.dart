import 'package:flutter/material.dart';
import 'package:flutter_lab_firebase_auth/main.dart';
import 'package:flutter_lab_firebase_auth/screens/create_account_screen.dart';
import 'package:flutter_lab_firebase_auth/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthService _service = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            children: [
              TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(hintText: "Email")),
              const SizedBox(height: 10),
              TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: "Password")),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () async {
                    bool res = await _service.login(
                        _emailController.text, _passwordController.text);
                    if (res) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text("Successful.")));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage(
                                    title: 'Flutter Home Page',
                                  )));
                    }
                  },
                  child: const Text("Login")),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MyHomePage(title: "Flutter Home Page")));
                },
                child: const Text("Don't have an account? Create now >>"),
              )
            ],
          ),
        ));
  }
}
