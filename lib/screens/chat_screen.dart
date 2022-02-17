import 'package:au_chat/components/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late String message;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = auth.currentUser;
      if (user != null) {
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        elevation: 0.0,
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
              Navigator.of(context)
                  .popUntil(ModalRoute.withName('welcome-screen'));
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        onChanged: (value) {
                          message = value;
                        },
                        decoration: kLoginDecoration.copyWith(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      firestore.collection('messages').add({
                        'sender': auth.currentUser?.email,
                        'message': message,
                        'time': FieldValue.serverTimestamp(),
                      });
                    },
                    icon: const Icon(Icons.arrow_upward_rounded),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshots) {
        if (snapshots.hasData != true) {
          return const Center(
            child: SpinKitThreeBounce(
              color: Colors.black,
              size: 40.0,
            ),
          );
        }
        final messages = snapshots.data!.docs.reversed;
        List<MessageBubble> messageList = [];
        for (var message in messages) {
          if (auth.currentUser!.email == message.get('sender')) {
            final sender = message.get('sender');
            final dataMessage = message.get('message');
            final bubble = MessageBubble(sender, dataMessage, true);
            messageList.add(bubble);
          } else {
            final sender = message.get('sender');
            final dataMessage = message.get('message');
            final bubble = MessageBubble(sender, dataMessage, false);
            messageList.add(bubble);
          }
        }
        return Expanded(
            child: ListView(
          reverse: true,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: messageList,
        ));
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  MessageBubble(this.sender, this.message, this.isMe);

  final bool isMe;
  final String sender;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              sender,
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: kWeirdblackColor,
              ),
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? const Radius.circular(30.0) : Radius.zero,
              topRight: isMe ? Radius.zero : const Radius.circular(30.0),
              bottomRight: const Radius.circular(30.0),
              bottomLeft: const Radius.circular(30.0),
            ),
            elevation: 0.0,
            color: isMe ? kRedColor : Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Text(
                message,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
