import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  final List<Color> colors = [
    Colors.white,
    Colors.blue,
    Colors.green,
    Colors.pink,
    Colors.yellow,
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[index],
      appBar: AppBar(
        title: const Text('色を変更'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              index = (index + 1) % colors.length;
            });
          },
          child: const Text('色を変える'),
        ),
      ),
    );
  }
}
