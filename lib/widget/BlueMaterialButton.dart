import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_web/utils/DpUtils.dart';

class BlueMaterialButton extends StatelessWidget {
  String title;
  Function function;

  BlueMaterialButton(this.title, this.function) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: Text(title),
        onPressed: function as void Function()?,
      ),
    );
  }
}
