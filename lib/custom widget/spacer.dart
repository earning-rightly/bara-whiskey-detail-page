import 'package:flutter/material.dart';

class CustomSpacer extends StatelessWidget {
  final double? height;

  CustomSpacer({Key? key, this.height = 10.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}