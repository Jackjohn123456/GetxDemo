import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SharedTextField {
  static Widget getFields({
    FocusNode? focusNode,
    String? label,
    required TextEditingController? controller,
    required String hint,
    required bool readOnly,
    required TextInputAction inputAction,
    required TextInputType inputType,
    String? suffixIcon,
    bool showButton = false,
    String buttonText = "",
    Function()? onButtonPressed,
    Function(String)? onChanged,
  }
      ){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(visible: label!=null,child: Text(label??"")),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: TextFormField(
                  focusNode: focusNode,
                  maxLines: 1,
                  onChanged: onChanged,
                  readOnly: readOnly,
                  textInputAction: inputAction,
                  keyboardType: inputType,
                  controller: controller,
                  decoration: InputDecoration(
                    filled: readOnly,
                    fillColor: readOnly?Color.fromARGB(255, 242, 242, 242):Colors.white,
                    hintText: hint,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color.fromARGB(255, 224, 224, 224)),
                    ),
                    suffixIcon:suffixIcon!=null ?Image.asset(suffixIcon):null,
                  ),
                ),
              ),
              SizedBox(width: showButton?10:0,),
              Visibility(
                visible: showButton,
                child: FilledButton(
                    onPressed: () => onButtonPressed,
                    style: ButtonStyle(
                      backgroundColor:WidgetStateProperty.resolveWith((states) {
                        return Color.fromARGB(255, 129, 48,239);
                      },),
                      shape: WidgetStateOutlinedBorder.resolveWith((states) {
                        return RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        );
                      },),
                      padding: WidgetStateProperty.resolveWith((states) {
                        return EdgeInsets.symmetric(vertical: 18,horizontal: 16);
                      },),
                    ),
                    child: Text(buttonText)),
              )
            ],
          )
        ],
      ),
    );
  }
}