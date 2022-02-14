import 'package:au_chat/screens/chat_screen.dart';
import 'package:au_chat/screens/login_screen.dart';
import 'package:au_chat/screens/registration_screen.dart';
import 'package:flutter/services.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AuChat());
}

class AuChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: 'welcome-screen',
      routes: {
        'welcome-screen': (context) => const WelcomeScreen(),
        'registration-screen': (context) => const RegistrationScreen(),
        'login-screen': (context) => const LoginScreen(),
        'chat-screen': (context) => const ChatScreen(),
      },
    );
  }
}
