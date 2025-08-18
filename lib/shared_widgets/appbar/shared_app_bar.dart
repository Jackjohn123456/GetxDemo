import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharedAppBar {
  static AppBar getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: Icon(
          color: Color.fromARGB(255, 188, 188, 188),
          size: 18,
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
