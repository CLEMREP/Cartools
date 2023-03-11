import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:frontend/src/Views/component/NavBarComponent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
          child: Form(
            key: _formKey,
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
                const SizedBox(
                  height: 50,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('E-Mail', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
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
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: ColorManager.fourthly
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: ColorManager.fourthly
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Mot de passe', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          child: Icon(
                            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                            color: ColorManager.primary,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        hintText: '••••••••••',
                        hintStyle: const TextStyle(color: Colors.grey),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: ColorManager.secondary50
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: ColorManager.primary
                          ),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: ColorManager.fourthly
                          ),
                        ),
                        focusedErrorBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: ColorManager.fourthly
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      bool response = await QueryApi.login(email.text, password.text);
                      if (response) {

                        bool response = await QueryApi.getUser();

                        NavBarComponent.selectedIndex = 1;
                        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);

                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('E-Mail ou mot de passe incorrect'),
                            backgroundColor: ColorManager.fourthly,
                          ),
                        );
                      }
                    }
                  },
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
                      Text('Se connecter'),
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
                      Icon(Icons.g_mobiledata,
                        color: ColorManager.secondary,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text('Se connecter avec Google',
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
                      Text('Se connecter avec Apple',
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
                      const Text('Vous n\'avez pas de compte ?',
                        style: TextStyle(
                          color: ColorManager.secondary,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, '/register', (route) => false);
                        },
                        child:
                        const Text('S\'enregistrer',
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
        ),
      ),
    );
  }
}