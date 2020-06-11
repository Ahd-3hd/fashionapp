import 'package:flutter/material.dart';

class Single extends StatefulWidget {
  @override
  _SingleState createState() => _SingleState();
}

class _SingleState extends State<Single> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Text('hi'),
      ),
    );
  }
}
