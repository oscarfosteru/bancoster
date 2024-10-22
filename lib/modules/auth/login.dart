import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _iniciarSesion(String emailInput, String passInput) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailInput,
        password: passInput,
      );

      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se encontró ningún usuario para ese correo electrónico.');
      } else if (e.code == 'wrong-password') {
        print('Se proporcionó una contraseña incorrecta para ese usuario.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.PNG',
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration:
                  const InputDecoration(labelText: 'correo electrónico'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _iniciarSesion(_emailController.text, _passwordController.text);
              },
              child: const Text('Iniciar sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/send_code');
              },
              child: const Text('Recuperar contraseña'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('Ir a Registro'),
            ),
          ],
        ),
      ),
    );
  }
}
