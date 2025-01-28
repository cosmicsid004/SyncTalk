import 'package:flutter/material.dart';

class Translated extends StatefulWidget {
  const Translated({super.key});

  @override
  State<Translated> createState() => _TranslatedState();
}

class _TranslatedState extends State<Translated> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          child: Text(
            'Some test text',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w400
            ),
          ),
        )
      ],
    );
  }
}