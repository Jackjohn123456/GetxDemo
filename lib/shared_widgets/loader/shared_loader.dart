import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharedLoader {
  static void showLoader(){
    Get.dialog(
      Align(
        alignment: Alignment.center,
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            width: 160,
            height: 60,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 5,
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  "Please Wait",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false
    );
  }

  static void hideLoader(){
    if (Get.isDialogOpen ?? false) {
      Get.back(); // This will close the dialog
    }
  }

}