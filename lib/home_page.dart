import 'package:flutter/material.dart';
import 'package:translator/content/buttons.dart';
import 'package:translator/content/speech_to_text.dart';
import 'package:translator/content/translated.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech Converter'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Translated(),
          Buttons(),
          SpeechScreen(),
        ],
      ),
    );
  }
}