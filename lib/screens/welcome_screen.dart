import 'package:flutter/material.dart';
import 'package:au_chat/components/blob_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  const Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFC5185),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(
                          Icons.email,
                          size: 45.0,
                        ),
                      ),
                      Text(
                        'Golden Chat',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: BlobButton(
                title: 'Login',
                color: Color(0xFF3FC1C9),
                onTap: () {
                  print('tapped');
                },
              ),
            ),
            BlobButton(
              title: 'Register',
              color: Color(0xFFFC5185),
              onTap: () {
                print('tapped again');
              },
            ),
          ],
        ),
      ),
    );
  }
}
