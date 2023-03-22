import 'package:flutter/material.dart';
class Fourth extends StatefulWidget {
  const Fourth({Key? key}) : super(key: key);

  @override
  State<Fourth> createState() => _FourthState();
}

class _FourthState extends State<Fourth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("fourth page"),
      ),
    );
  }
}
