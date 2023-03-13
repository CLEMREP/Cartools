import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';
import 'package:frontend/src/Services/http/QueryApi.dart';

class YourAccountComponent extends StatefulWidget {
  const YourAccountComponent({Key? key}) : super(key: key);

  @override
  State<YourAccountComponent> createState() => _YourAccountComponentState();
}

class _YourAccountComponentState extends State<YourAccountComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Votre compte',
                  style: TextStyle(
                    color: ColorManager.secondary,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
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
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () async {
                        },
                        child: Container(
                          width: 200,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Centre de compte',
                                style: TextStyle(
                                  color: ColorManager.secondary,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text('Mot de passe, sécurité, détails personnel, publicités',
                                style: TextStyle(
                                  color: ColorManager.secondary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right,
                  size: 26,
                  color: ColorManager.secondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
