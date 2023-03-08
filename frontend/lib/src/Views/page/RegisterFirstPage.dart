import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:frontend/src/Views/page/RegisterSecondPage.dart';

class RegisterFirstPage extends StatefulWidget {
  const RegisterFirstPage({Key? key}) : super(key: key);

  @override
  State<RegisterFirstPage> createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {

  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();

  bool isPasswordVisible = false;
  bool isPasswordConfirmationVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
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
              SizedBox(
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
                    key: _emailKey,
                    onChanged: (value) {
                      _emailKey.currentState!.validate();
                    },
                    validator: (value) {
                      RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                      if (!regex.hasMatch(value!)) {
                        return 'Votre e-mail n\'est pas au bon format.';
                      }
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner votre e-mail.';
                      }
                      return null;
                    },
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
                      suffix: GestureDetector(
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
                      hintText: '**********',
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
                    key: _passwordKey,
                    onChanged: (value) {
                      _passwordKey.currentState!.validate();
                    },
                    validator: (value) {
                      RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (!regex.hasMatch(value!)) {
                        return 'Il faut au moins 8 caractères, une majuscule, une minuscule, un chiffre et un caractère spécial';
                      }
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner un mot de passe';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Confirmation mot de passe', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passwordConfirmation,
                    obscureText: !isPasswordConfirmationVisible,
                    decoration: InputDecoration(
                      suffix: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordConfirmationVisible = !isPasswordConfirmationVisible;
                          });
                        },
                        child: Icon(
                          isPasswordConfirmationVisible ? Icons.visibility : Icons.visibility_off,
                          color: ColorManager.primary,
                        ),
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      hintText: '**********',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Merci de remplir le champ.';
                      }
                      if (value != password.text) {
                        return 'Les mots de passe ne correspondent pas';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterSecondPage(
                          email: email.text,
                          password: password.text,
                          passwordConfirmation: passwordConfirmation.text),
                      ),
                    );
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
                    Icon(Icons.g_mobiledata,
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
      ),
    );
  }
}
