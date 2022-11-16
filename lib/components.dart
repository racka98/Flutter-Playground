import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_playground/paddings.dart';

Widget myAppBar = Padding(
  padding: const EdgeInsets.symmetric(
      horizontal: Dimens.largePadding, vertical: Dimens.largePadding),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Menu Icons
      Image.asset(
        'lib/icons/menu.png',
        height: 45,
        color: Colors.grey[500],
      ),

      // Account Icon
      Icon(
        Icons.person,
        size: 45,
        color: Colors.grey[500],
      )
    ],
  ),
);

Widget welcomeText = Padding(
  padding: const EdgeInsets.symmetric(horizontal: Dimens.largePadding),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text('Welcome Home,'),
      Text(
        'Racka!',
        style: TextStyle(fontSize: 40),
      ),
    ],
  ),
);

Widget smartDevicesText = const Padding(
  padding: EdgeInsets.symmetric(horizontal: Dimens.largePadding),
  child: Text('Smart Devices'),
);

Widget smartDevices = Expanded(
    child: GridView.builder(
        itemCount: mySmartDevices.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
        padding: const EdgeInsets.all(Dimens.mediumPadding),
        itemBuilder: (context, index) {
          return SmartDeviceBox(
            deviceName: mySmartDevices[index][0],
            iconPath: mySmartDevices[index][1],
            powerOn: mySmartDevices[index][2],
          );
        }));

class SmartDeviceBox extends StatelessWidget {
  const SmartDeviceBox(
      {super.key,
      required this.deviceName,
      required this.iconPath,
      required this.powerOn});

  final String deviceName;
  final String iconPath;
  final bool powerOn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.mediumPadding),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: Dimens.mediumPadding),
        decoration: BoxDecoration(
            color: powerOn ? Colors.grey[900] : Colors.grey[200],
            borderRadius: BorderRadius.circular(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Icon
            Image.asset(
              iconPath,
              height: 65,
              color: powerOn ? Colors.white : Colors.black,
            ),

            // Smart Device Name + switch
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: Dimens.mediumPadding),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    deviceName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: powerOn ? Colors.white : Colors.black),
                  )),
                  Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                          value: powerOn, onChanged: (value) {}))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// List of Smart devices
List mySmartDevices = [
  // [ smartDeviceName, iconPath, powerStatus ]
  ['Smart Light', 'lib/icons/light-bulb.png', true],
  ['Smart AC', 'lib/icons/air-conditioner.png', false],
  ['Smart TV', 'lib/icons/smart-tv.png', true],
  ['Smart Fan', 'lib/icons/fan.png', false],
];
