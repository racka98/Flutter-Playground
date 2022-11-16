
import 'package:flutter/material.dart';
import 'package:flutter_playground/components.dart';
import 'package:flutter_playground/paddings.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom AppBar
            myAppBar,

            const SizedBox(height: Dimens.mediumPadding),

            // Welcome Text
            welcomeText,

            const SizedBox(height: Dimens.mediumPadding),

            // Smart Devices
            smartDevicesText,
            smartDevices,
          ],
        ),
      ),
    );
  }
}

