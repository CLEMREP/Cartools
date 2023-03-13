import 'package:flutter/material.dart';

class ElectricPage extends StatefulWidget {
  const ElectricPage({Key? key}) : super(key: key);

  @override
  State<ElectricPage> createState() => _ElectricPageState();
}

class _ElectricPageState extends State<ElectricPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Electrique'),
    );
  }
}
