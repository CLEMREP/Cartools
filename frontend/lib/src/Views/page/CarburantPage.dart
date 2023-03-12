import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Views/component/BetweenPlaceComponent.dart';
import 'package:frontend/src/Views/component/ChoiceComponent.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/PlaceComponent.dart';

class CarburantPage extends StatefulWidget {
  const CarburantPage({Key? key}) : super(key: key);

  @override
  State<CarburantPage> createState() => _CarburantPageState();
}

class _CarburantPageState extends State<CarburantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const ChoiceComponent(),
              Expanded(
                child: FutureBuilder<List<GazStation>>(
                  future: GazStationRepository.getStationsZone(20),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        shrinkWrap: true,
                        //itemCount: GazStationRepository.gazStations.length * 2, // 10 alors 5 car 10 / 2 = 5 | 11 alors 6 car 11 / 2 = 5.5 donc 6
                        itemCount: snapshot.data!.length * 2,
                        itemBuilder: (context, index) {
                          return (index % 2 == 0)
                              //? PlaceComponent(gazStation: GazStationRepository.gazStations[index ~/ 2])
                              ? PlaceComponent(gazStation: snapshot.data![index ~/ 2])
                              : const BetweenPlaceComponent();
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          snapshot.error.toString(),
                          style: TextStyle(
                            color: ColorManager.secondary,
                            fontSize: 14,
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          )
      ),
    );
  }
}
