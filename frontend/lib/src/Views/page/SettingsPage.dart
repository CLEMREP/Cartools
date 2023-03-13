import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';
import 'package:frontend/src/Views/component/settings/MoreInformationAndSupportComponent.dart';
import 'package:frontend/src/Views/component/settings/YourAccountComponent.dart';
import 'package:frontend/src/Views/page/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.chevron_left,
                      size: 36,
                      color: ColorManager.secondary,
                    ),
                  ),
                  const Text('Paramètres',
                    style: TextStyle(
                      color: ColorManager.secondary,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const YourAccountComponent(),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              height: 2,
              color: ColorManager.secondary50,
            ),
            const MoreInformationAndSupportComponent(),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                bool response = await QueryApi.logout();
                if (response) {

                  NavBarComponent.selectedIndex = 1;

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                    (route) => false,
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                decoration: BoxDecoration(
                  color: ColorManager.fourthly,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text('Déconnexion',
                    style: TextStyle(
                      color: ColorManager.thirdly,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
