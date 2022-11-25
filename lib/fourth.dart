import 'package:flutter/material.dart';

class fourth extends StatefulWidget {
  const fourth({Key? key}) : super(key: key);

  @override
  State<fourth> createState() => _fourthState();
}

class _fourthState extends State<fourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ColoredBox(color: Colors.blueAccent),
        Text("Hardik"),
      ]),
    );
  }
}
