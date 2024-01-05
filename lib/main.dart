import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Home',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ChatTextField());
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Chat'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: const [
              InBubble(message: 'Hello'),
              OutBubble(message: 'Hi there'),
              OutBubble(message: 'How it going?'),
              InBubble(message: 'Everything is OK'),
              OutBubble(message: 'Goodbye'),
              InBubble(message: 'See you soon')
            ],
          ),
        ));
  }
}

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key}) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

// something like @observable
class _ChatTextFieldState extends State<ChatTextField> {
  List<String> messages = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return index % 2 == 0
                  ? InBubble(message: messages[index])
                  : OutBubble(message: messages[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 50,
            child: Material(
              child: Row(
                children: <Widget>[
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'talk to ai',
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        messages.add("New message");
                      });
                    },
                    child: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
