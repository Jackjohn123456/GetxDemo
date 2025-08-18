import 'package:flutter/material.dart';

class SharedTiles {
  static Widget getTiles({
    String? imagePath,
    Color? suffixIconColor,
    required String title,
    Function()? onTap,
  }) {
    //Could Have Used ListView
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 242, 242, 242), // border color
            width: 1, // border width
          ),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: imagePath!=null?Image.asset(imagePath):null,
        title: Text(title),
        hoverColor: Colors.grey,
        trailing: Icon(
          color: suffixIconColor ?? Color.fromARGB(255, 188, 188, 188),
          size: 18,
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    );
  }
}