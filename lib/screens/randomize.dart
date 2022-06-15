import 'dart:math';

import 'package:flutter/material.dart';

class Randomize extends StatefulWidget {
  final int min, max;

  const Randomize({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  _RandomizeState createState() => _RandomizeState();
}

class _RandomizeState extends State<Randomize> {
  int? _generateNum;
  final Random randomGenerator = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomize'),
      ),
      body: Center(
          child: Text(
        _generateNum?.toString() ?? 'Generate A number',
        style: TextStyle(fontSize: 30),
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Generate'),
        onPressed: () {
          setState(() {
            _generateNum = widget.min +
                randomGenerator.nextInt(widget.max + 1 - widget.min);
            // _generateNum = randomGenerator.nextInt(widget.max);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
