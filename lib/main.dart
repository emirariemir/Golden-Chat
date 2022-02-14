import 'package:au_chat/screens/chat_screen.dart';
import 'package:au_chat/screens/login_screen.dart';
import 'package:au_chat/screens/registration_screen.dart';
import 'screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AuChat());
}

class AuChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
