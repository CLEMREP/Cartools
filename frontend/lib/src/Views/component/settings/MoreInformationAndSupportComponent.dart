import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

class MoreInformationAndSupportComponent extends StatefulWidget {
  const MoreInformationAndSupportComponent({Key? key}) : super(key: key);

  @override
  State<MoreInformationAndSupportComponent> createState() => _MoreInformationAndSupportComponentState();
}

class _MoreInformationAndSupportComponentState extends State<MoreInformationAndSupportComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Informations suplémentaire et support',
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
                        Icons.help,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Aide',
                              style: TextStyle(
                                color: ColorManager.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
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
          SizedBox(
            height: 10,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info,
                        size: 26,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('À propos',
                              style: TextStyle(
                                color: ColorManager.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ],
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
