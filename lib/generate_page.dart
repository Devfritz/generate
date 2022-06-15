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
  final formKey = GlobalKey<FormState>();

  @override
  build(BuildContext context) {
    print(min);
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate'),
      ),
      body: FormRangeValue(
          formKey: formKey,
          minValue: (value) => min = value,
          maxValue: (value) => max = value),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            formKey.currentState?.save();
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
