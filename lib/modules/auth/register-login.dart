import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  Future<void> _registrarUsuario(String emailInput, String passInput) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailInput, password: passInput);
      print('Usuario registrado con éxito');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('La contraseña proporcionada es demasiado débil.');
      } else if (e.code == 'email-already-in-use') {
        print('La cuenta ya existe para ese correo electrónico.');
      } else {
        print('Error: ${e.message}');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
              controller: emailController,
              decoration:
                  const InputDecoration(labelText: 'correo electrónico'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'contraseña'),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordController,
              decoration:
                  const InputDecoration(labelText: 'confirmar contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (passwordController.text == confirmPasswordController.text) {
                  _registrarUsuario(
                      emailController.text, passwordController.text);
                } else {
                  print('Las contraseñas no coinciden');
                }
              },
              child: const Text('Registrarse'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Ya tengo una cuenta'),
            ),
          ],
        ),
      ),
    );
  }
}
