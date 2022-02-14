import 'package:flutter/material.dart';
import 'package:au_chat/components/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        elevation: 0.0,
        backgroundColor: pinkColor,
      ),
      backgroundColor: Colors.white,
    );
  }
}
