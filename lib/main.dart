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
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
                .copyWith(background: Colors.white)),
        home: Scaffold(
            appBar: AppBar(title: const Text("chat")),
            body: const SafeArea(child: ChatTextField())));
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
