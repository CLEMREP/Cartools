import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/GazStation.dart';
import 'package:frontend/src/Db/repository/GazStationRepository.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/GlobalState.dart';
import 'package:frontend/src/Services/Providers/FilterProvider.dart';
import 'package:frontend/src/Views/component/BetweenPlaceComponent.dart';
import 'package:frontend/src/Views/component/ChoiceComponent.dart';
import 'package:frontend/src/Views/component/ChoiceRadiusComponent.dart';
import 'package:frontend/src/Views/component/FilterComponent.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/PlaceComponent.dart';
import 'package:provider/provider.dart';

class StationPage extends StatefulWidget {
  const StationPage({Key? key}) : super(key: key);

  @override
  State<StationPage> createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 25, bottom: 0, left: 25, right: 25),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          //shadow
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              hintText: 'Rechercher',
                            ),
                          ),
                        )
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          GlobalState.filterController.isAttached
                              ? GlobalState.filterController.open()
                              : GlobalState.filterController.close();
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: ColorManager.secondary,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: const Icon(
                            Icons.filter_alt_outlined,
                            color: ColorManager.thirdly,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<FilterProvider>(
                    builder: (context, filter, child) {
                      return FutureBuilder<List<GazStation>>(
                        future: GazStationRepository.getStationsFilter(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              padding: const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length * 2,
                              itemBuilder: (context, index) {
                                return (index % 2 == 0)
                                    ? PlaceComponent(gazStation: snapshot.data![index ~/ 2])
                                    : const BetweenPlaceComponent();
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                style: const TextStyle(
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
