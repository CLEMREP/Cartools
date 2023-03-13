import 'package:flutter/material.dart';

class WashingPage extends StatefulWidget {
  const WashingPage({Key? key}) : super(key: key);

  @override
  State<WashingPage> createState() => _WashingPageState();
}

class _WashingPageState extends State<WashingPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Lavage'),
    );
  }
}
