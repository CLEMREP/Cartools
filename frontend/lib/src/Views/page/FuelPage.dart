import 'package:flutter/material.dart';

class FuelPage extends StatefulWidget {
  const FuelPage({Key? key}) : super(key: key);

  @override
  State<FuelPage> createState() => _FuelPageState();
}

class _FuelPageState extends State<FuelPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Carburant'),
    );
  }
}
