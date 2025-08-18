import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/shared_widgets/appbar/shared_app_bar.dart';
import 'package:getxdemo/shared_widgets/tiles/shared_tiles.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar.getAppBar(),
      body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Personal Information",style: TextStyle(fontSize: 24),),
              ),
              SharedTiles.getTiles(title: "Basic Info",suffixIconColor: Colors.black,onTap: () => Get.toNamed("basicInfo"),),
              SharedTiles.getTiles(title: "Set Password",suffixIconColor: Colors.black,onTap: () => Get.toNamed('credentials'),),
              SharedTiles.getTiles(title: "Category of Interest",suffixIconColor: Colors.black),
            ],
          )
      ),
    );
  }
}
