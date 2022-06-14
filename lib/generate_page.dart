import 'package:flutter/material.dart';
import 'package:pratique_flutter/form-rangeValue.dart';
import 'package:pratique_flutter/screens/randomize.dart';

class Generate extends StatefulWidget {
  const Generate({Key? key}) : super(key: key);

  @override
  _GenerateState createState() => _GenerateState();
}

class _GenerateState extends State<Generate> {
  int min = 0;
  int max = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate'),
      ),
      body: FormRangeValue(
        formKey: _formKey,
        minValue: (value) => value = min,
        maxValue: (value) => value = max,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          if (_formKey.currentState?.validate() == true) {
            _formKey.currentState?.save();
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => Randomize(min: min, max: max)),
            );
          }
        },
      ),
    );
  }
}
