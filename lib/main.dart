import 'package:bancoster/firebase_options.dart';
import 'package:flutter/material.dart';
import 'modules/auth/login.dart';
import 'modules/auth/passwordReset.dart';
import 'modules/auth/verifierCode.dart';
import 'modules/auth/register-login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/send_code': (context) => SendCodeScreen(),
        '/verify_code': (context) => VerifyCodeScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
