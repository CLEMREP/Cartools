import 'package:flutter/material.dart';
import 'package:frontend/src/Services/ColorManager.dart';

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
                Text('Your account',
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
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Accounts Center',
                              style: TextStyle(
                                color: ColorManager.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text('Password, security, personal details, ads',
                              style: TextStyle(
                                color: ColorManager.secondary,
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
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
