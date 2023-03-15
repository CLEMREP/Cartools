import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Views/page/SettingsPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton(
                    value: 0,
                    items: const [
                      DropdownMenuItem(
                        child: Text('Peugeot',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                            color: ColorManager.secondary
                          ),
                        ),
                        value: 0,
                      ),
                      DropdownMenuItem(
                        child: Text('Renault',
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorManager.secondary
                          ),
                        ),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Citroen',
                          style: TextStyle(
                              fontSize: 20,
                              color: ColorManager.secondary
                          ),
                        ),
                        value: 2,
                      ),
                    ],
                    onChanged: (value) {},
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: ColorManager.secondary,
                    ),
                    underline: Container(
                      height: 0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    // en bas
                    dropdownColor: ColorManager.thirdly,
                    elevation: 1,
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 36,
                        color: ColorManager.secondary,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        children: const [
                          Text(
                            '308 SW',
                            style: TextStyle(
                                fontSize: 16,
                                color: ColorManager.secondary
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 300,
                      child: Stack(
                        children: [
                          Positioned(
                            right: -100,
                            child: Container(
                              width: 525,
                              height: 300,
                              child: Image.asset('assets/images/car.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: ColorManager.secondary
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: ColorManager.secondary,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Center(
                              child: Icon(Icons.ev_station,
                                color: ColorManager.thirdly,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Capacité du réservoir',
                                  style: TextStyle(
                                    color: ColorManager.secondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                      children: const [
                                        Text('75',
                                          style: TextStyle(
                                            color: ColorManager.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          'L',
                                          style: TextStyle(
                                            color: ColorManager.secondary,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: ColorManager.secondary
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: const BoxDecoration(
                              color: ColorManager.secondary,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            child: const Center(
                              child: Icon(Icons.ev_station,
                                color: ColorManager.thirdly,
                                size: 30,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Consommation moyenne',
                                  style: TextStyle(
                                    color: ColorManager.secondary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: const [
                                      Text('8.5',
                                        style: TextStyle(
                                          color: ColorManager.primary,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        'L/100',
                                        style: TextStyle(
                                          color: ColorManager.secondary,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
