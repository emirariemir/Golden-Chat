import 'package:au_chat/components/blob_button.dart';
import 'package:flutter/material.dart';
import 'package:au_chat/components/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  late String email;
  late String password;
  late String username;
  bool loggin = false;

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
              padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: loggin
                  ? const SpinKitThreeBounce(
                      color: kPinkColor,
                      size: 30.0,
                    )
                  : const Text(
                      'Lets get your info!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                onChanged: (value) {
                  username = value;
                },
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
                onChanged: (value) {
                  email = value;
                },
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
                onChanged: (value) {
                  password = value;
                },
                decoration: kRegisterDecoration.copyWith(
                  hintText: 'Enter a password here.',
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            BlobButton(
              title: 'Register',
              color: kPinkColor,
              onTap: () async {
                try {
                  setState(() {
                    loggin = true;
                  });
                  final newUser = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  firestore.collection('users').add({
                    'username': username,
                    'email': email,
                    'password': password,
                  });
                  print(newUser.user);
                  Navigator.pushNamed(context, 'chat-screen');
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
