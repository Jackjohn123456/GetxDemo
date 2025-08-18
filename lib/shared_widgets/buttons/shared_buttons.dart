import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedButtons {
  static Widget saveButton({Function()? onPressed}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: FilledButton(
          onPressed:onPressed,
          style: ButtonStyle(
            backgroundColor:WidgetStateProperty.resolveWith((states) {
              return Color.fromARGB(255, 206, 206,206);
            },),
            shape: WidgetStateOutlinedBorder.resolveWith((states) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              );
            },),
            padding: WidgetStateProperty.resolveWith((states) {
              return EdgeInsets.symmetric(vertical: 12,horizontal: 16);
            },),
          ),
          child: Text("Save")),
    );
  }
}