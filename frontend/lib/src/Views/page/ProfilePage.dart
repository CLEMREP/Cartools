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
                  Container(
                    child: Row(
                      children: const [
                        Text(
                          'Peugeot',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: ColorManager.secondary
                          ),
                        ),
                        Icon(Icons.arrow_drop_down),
                      ],
                    ),
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: ColorManager.secondary
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.ev_station,
                          size: 40,
                          color: ColorManager.primary,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '60 L',
                          style: TextStyle(
                            color: ColorManager.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: ColorManager.secondary
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.discount,
                          size: 40,
                          color: ColorManager.primary,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '6 L / 100',
                          style: TextStyle(
                            color: ColorManager.secondary,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
    );
  }
}
