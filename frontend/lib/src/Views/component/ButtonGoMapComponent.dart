import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:map_launcher/map_launcher.dart';

class ButtonGoMapComponent extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String title;
  const ButtonGoMapComponent({Key? key, required this.latitude, required this.longitude, required this.title}) : super(key: key);

  @override
  State<ButtonGoMapComponent> createState() => _ButtonGoMapComponentState();
}

class _ButtonGoMapComponentState extends State<ButtonGoMapComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final availableMaps = await MapLauncher.installedMaps;
        await availableMaps.first.showMarker(
          coords: Coords(widget.latitude, widget.longitude),
          title: widget.title,
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: const BoxDecoration(
          color: ColorManager.secondary,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Center(
          child: Text('Voir sur la carte',
            style: const TextStyle(
              color: ColorManager.thirdly,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
