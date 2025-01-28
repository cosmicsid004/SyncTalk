import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
           child: Text(
            'Speak'
           )
        ),
        ElevatedButton(
          onPressed: () {},
           child: Text(
            'Translate'
           )
        ),
      ],
    );
  }
}