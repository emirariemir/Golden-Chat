import 'package:au_chat/components/blob_button.dart';
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
        backgroundColor: kPinkColor,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onChanged: (value) {},
                decoration: kRegisterDecoration.copyWith(
                  hintText: 'Enter your username here',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {},
                decoration: kRegisterDecoration.copyWith(
                    hintText: 'Enter your email here.'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                obscureText: true,
                onChanged: (value) {},
                decoration: kRegisterDecoration.copyWith(
                  hintText: 'Enter a password here.',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlobButton(title: 'Register', color: kPinkColor, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
