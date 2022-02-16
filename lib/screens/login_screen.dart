import 'package:au_chat/components/blob_button.dart';
import 'package:flutter/material.dart';
import 'package:au_chat/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color(0xFF3FC1C9),
        elevation: 0.0,
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  //print(value);
                  email = value;
                },
                decoration: kLoginDecoration.copyWith(
                    hintText: 'Enter your mail here.'),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //print(value);
                },
                decoration: kLoginDecoration.copyWith(
                  hintText: 'Enter your password here',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlobButton(
              title: 'Login',
              color: kBlueColor,
              onTap: () async {
                try {
                  final userCre = await auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (userCre.user != null) {
                    print('success');
                    Navigator.pushNamed(context, 'chat-screen');
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
