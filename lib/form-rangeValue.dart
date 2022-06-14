import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class FormRangeValue extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final IntValueSetter minValue;
  final IntValueSetter maxValue;

  const FormRangeValue(
      {Key? key,
      required this.formKey,
      required this.minValue,
      required this.maxValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputUser(labelText: 'minimum', onChange: minValue),
            SizedBox(height: 10),
            InputUser(labelText: 'maximum', onChange: maxValue)
          ],
        ),
      ),
    );
  }
}

class InputUser extends StatelessWidget {
  final String labelText;
  final IntValueSetter onChange;
  const InputUser({Key? key, required this.labelText, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      onSaved: (val) => onChange(int.parse(val ?? '')),
      validator: (val) {
        if (val == null || int.tryParse(val) == null) {
          return 'A number is required';
        } else {
          return null;
        }
      },
    );
  }
}
