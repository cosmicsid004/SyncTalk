import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Voice',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.blueGrey,
        brightness: Brightness.dark,
      )),
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  late stt.SpeechToText _speech; //late means the variable will be initialized later, but it’s guaranteed to be initialized before being used.
  bool _isListninig = false;
  String _text = 'Press the button and start speaking';
  var col = Colors.red;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text to Speech Converter'),
        backgroundColor: Colors.blueGrey,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        glowColor: col,
        animate: true,
        endRadius: 75.0,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListninig ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Text(
            _text,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListninig) {
      //This checks if the speech recognition is available and successfully initialized.
      bool available = await _speech.initialize( //This function initializes the speech-to-text engine and makes sure it’s ready to listen.
        onStatus: (val) => print('onStatus: $val'), //whether it’s listening, processing, or stopped
        onError: (val) => print('onError: $val'), //no speech detected, permission issues
      );
      if (available) {
        setState(() {
        _isListninig = true;
        col = Colors.green;
        });
        _speech.listen( //to start listening to the user's speech.
          onResult: (val) => setState(() {
            _text = val.recognizedWords; //The recognized words are stored in the _text variable
          }),
        );
      }
    } else {
      setState(() {
        _isListninig = false;
        col = Colors.red;
      });
      _speech.stop();
    }
  }
}