import 'package:flutter/material.dart';

class TextTitleAuthWidget extends StatelessWidget {
  final String text;

  const TextTitleAuthWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
