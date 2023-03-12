import 'package:flutter/material.dart';
import 'package:frontend/src/Db/model/User.dart';
import 'package:frontend/src/Db/model/Vehicule.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterVehiculePage extends StatefulWidget {
  const RegisterVehiculePage({Key? key}) : super(key: key);

  @override
  State<RegisterVehiculePage> createState() => _RegisterVehiculePageState();
}

class _RegisterVehiculePageState extends State<RegisterVehiculePage> {

  final selectedMarque = TextEditingController();
  final selectedModele = TextEditingController();
  final selectedVehicule = TextEditingController();
  final reservoir = TextEditingController();
  final consommation = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              const SizedBox(
                height: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Véhicule', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Voiture',
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
                    items: const [
                      DropdownMenuItem(
                        child: const Text('Voiture'),
                        value: 'Voiture',
                      ),
                      DropdownMenuItem(
                        child: const Text('Moto'),
                        value: 'Moto',
                      ),
                      DropdownMenuItem(
                        child: const Text('Camion'),
                        value: 'Camion',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedVehicule.text = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Veuillez renseigner votre véhicule';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Marque', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Peugeot',
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
                    items: const [
                      DropdownMenuItem(
                        child: const Text('Peugeot'),
                        value: 'Peugeot',
                      ),
                      DropdownMenuItem(
                        child: const Text('Reunault'),
                        value: 'Reunault',
                      ),
                      DropdownMenuItem(
                        child: const Text('Citroen'),
                        value: 'Citroen',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedMarque.text = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Veuillez renseigner votre marque';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Modele', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: '308',
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
                    items: const [
                      DropdownMenuItem(
                        child: const Text('308'),
                        value: '308',
                      ),
                      DropdownMenuItem(
                        child: const Text('207'),
                        value: '207',
                      ),
                      DropdownMenuItem(
                        child: const Text('5008'),
                        value: '5008',
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedModele.text = value.toString();
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return 'Veuillez renseigner votre modele';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Reservoir (L)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: reservoir,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: '70',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner la capacité de votre reservoir';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Consomation (L/100 km)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: consommation,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: '6',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez renseigner votre consomation';
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    Vehicule.brand = selectedMarque.text;
                    Vehicule.model = selectedModele.text;
                    Vehicule.reservoir = int.parse(reservoir.text);
                    Vehicule.consumption = double.parse(consommation.text);

                    User.vehicule = Vehicule();

                    bool response = await QueryApi.setVehicule();
                    if (response) {
                      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
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
                    Text('Continuer'),
                    Icon(Icons.chevron_right),
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
                    const Text('Revenir en arrière ?',
                      style: TextStyle(
                        color: ColorManager.secondary,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.remove('token');

                        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                      },
                      child:
                      const Text('Retour',
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
