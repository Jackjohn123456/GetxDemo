import 'package:flutter/material.dart';
import 'package:getxdemo/shared_widgets/appbar/shared_app_bar.dart';
import 'package:getxdemo/shared_widgets/buttons/shared_buttons.dart';
import 'package:getxdemo/shared_widgets/text_fields/shared_text_field.dart';

class Credentials extends StatelessWidget {
  Credentials({super.key});

  final TextEditingController _defaultController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _verifyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: SharedAppBar.getAppBar(),
      body: SafeArea(child:
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("Personal Information",style: TextStyle(fontSize: 24),),
          ),
          SharedTextField.getFields(
            label: "Default Password",
            controller: _defaultController,
            hint: "8-16 characters combination of English letters, numbers, and special characters",
            readOnly: false,
            inputAction: TextInputAction.next,
            inputType: TextInputType.visiblePassword,
          ),
          SharedTextField.getFields(
            label: "New Password",
            controller: _newController,
            hint: "8-16 characters combination of English letters, numbers, and special characters",
            readOnly: false,
            inputAction: TextInputAction.next,
            inputType: TextInputType.visiblePassword,
          ),
          SharedTextField.getFields(
            label: "Verify Password",
            controller: _verifyController,
            hint: "Please re-enter your password.",
            readOnly: false,
            inputAction: TextInputAction.next,
            inputType: TextInputType.visiblePassword,
          ),
          SharedButtons.saveButton(onPressed: () {

          },)
        ],
      )
      ),
    );
  }
}
