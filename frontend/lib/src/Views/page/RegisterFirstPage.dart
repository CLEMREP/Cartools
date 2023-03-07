import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class RegisterFirstPage extends StatefulWidget {
  const RegisterFirstPage({Key? key}) : super(key: key);

  @override
  State<RegisterFirstPage> createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.car_crash,
                  size: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('CarTools',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('E-Mail', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'example@gmail.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: ColorManager.secondary50
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: ColorManager.primary
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Mot de passe', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '**********',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: ColorManager.secondary50
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: ColorManager.primary
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Confirmation mot de passe', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    hintText: '**********',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: ColorManager.secondary50
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: ColorManager.primary
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => print('ok'),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  Text('Continuer'),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      color: ColorManager.secondary50,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text('or'),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      color: ColorManager.secondary50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => print('ok'),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.invisible,
                shadowColor: ColorManager.invisible,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: ColorManager.secondary50,
                  ),
                ),
                padding: const EdgeInsets.all(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.icecream,
                    color: ColorManager.secondary,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Continuer avec Google',
                    style: TextStyle(
                      color: ColorManager.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => print('ok'),
              style: ElevatedButton.styleFrom(
                primary: ColorManager.invisible,
                shadowColor: ColorManager.invisible,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: ColorManager.secondary50,
                  ),
                ),
                padding: const EdgeInsets.all(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.apple,
                    color: ColorManager.secondary,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Continuer avec Apple',
                    style: TextStyle(
                      color: ColorManager.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Vous avez déja un compte ?',
                    style: TextStyle(
                      color: ColorManager.secondary,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child:
                    const Text('Se connecter',
                      style: TextStyle(
                        color: ColorManager.secondary,
                        fontWeight: FontWeight.bold,
                      ),
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
