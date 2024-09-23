import 'package:flutter/material.dart';
import 'package:tugas4tpm/homepage.dart'; 

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoginSuccess = true; 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _usernameField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 20),
              _loginButton(context),
              if (!_isLoginSuccess) //salah
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    "Username atau Password salah",
                    style: TextStyle(color: Colors.red),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      controller: _usernameController,
      decoration: const InputDecoration(
        labelText: 'Username',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final username = _usernameController.text;
        final password = _passwordController.text;

        bool loginSuccess = await checkCredentials(username, password);
        setState(() {
          _isLoginSuccess = loginSuccess;
        });

        if (loginSuccess) { //sukses
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MenuUtama()), 
          );
        }
      },
      child: const Text('Login'),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        padding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}

Future<bool> checkCredentials(String username, String password) async {
  const allowedCredentials = {
    'aini': '124220141',
  };

  
  return allowedCredentials.containsKey(username) &&
      allowedCredentials[username] == password;
}
