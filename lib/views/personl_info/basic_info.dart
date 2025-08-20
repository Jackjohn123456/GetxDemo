import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/campaign/user_controller.dart';
import 'package:getxdemo/models/user.dart';
import 'package:getxdemo/shared_widgets/appbar/shared_app_bar.dart';
import 'package:getxdemo/shared_widgets/buttons/shared_buttons.dart';
import 'package:getxdemo/shared_widgets/loader/shared_loader.dart';
import 'package:getxdemo/shared_widgets/text_fields/shared_text_field.dart';

class BasicInfo extends StatelessWidget {
  BasicInfo({super.key});
  final UserController _userController = Get.find<UserController>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _instaIdController = TextEditingController();
  final TextEditingController _workLinkController = TextEditingController();
  final TextEditingController _portfolioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _idController.text = _userController.user!.id;
    _emailController.text = _userController.user!.email;
    _phoneController.text = _userController.user!.phone;
    _nickNameController.text = _userController.user!.nickName;
    _instaIdController.text = _userController.user!.instaId;
    _workLinkController.text = _userController.user!.workLink;
    _portfolioController.text = _userController.user!.portfolio;
    return Scaffold(
      appBar: SharedAppBar.getAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text("Basic Information", style: TextStyle(fontSize: 24)),
            ),
            SharedTextField.getFields(
              label: "ID",
              controller: _idController,
              hint: _idController.text.isNotEmpty ? _idController.text : "id",
              readOnly: true,
              inputAction: TextInputAction.next,
              inputType: TextInputType.name,
            ),
            SharedTextField.getFields(
              label: "Email",
              controller: _emailController,
              hint: _emailController.text.isNotEmpty ? "" : "email",
              readOnly: false,
              inputAction: TextInputAction.next,
              inputType: TextInputType.emailAddress,
            ),
            SharedTextField.getFields(
              label: "Phone",
              showButton: true,
              buttonText: "Change",
              onButtonPressed: () {},
              controller: _phoneController,
              hint: _phoneController.text.isNotEmpty ? "" : "phone",
              readOnly: false,
              inputAction: TextInputAction.next,
              inputType: TextInputType.phone,
            ),
            SharedTextField.getFields(
              label: "Nick Name",
              controller: _nickNameController,
              hint: _nickNameController.text.isNotEmpty ? "" : "nick name",
              readOnly: false,
              inputAction: TextInputAction.next,
              inputType: TextInputType.name,
            ),
            SharedTextField.getFields(
              label: "Instagram",
              controller: _instaIdController,
              hint: _instaIdController.text.isNotEmpty ? "" : "instagram",
              readOnly: false,
              inputAction: TextInputAction.next,
              inputType: TextInputType.text,
            ),
            SharedTextField.getFields(
              label: "Representative Work Link",
              controller: _workLinkController,
              hint: _workLinkController.text.isNotEmpty ? "" : "projects",
              readOnly: false,
              inputAction: TextInputAction.next,
              inputType: TextInputType.text,
            ),
            SharedTextField.getFields(
              label: "PortFolio",
              controller: _portfolioController,
              hint: _phoneController.text.isNotEmpty ? "" : "portfolio",
              readOnly: false,
              inputAction: TextInputAction.next,
              inputType: TextInputType.text,
              suffixIcon: "assets/icons/attachments.png",
            ),
            SharedButtons.saveButton(
              onPressed: () async {
                SharedLoader.showLoader();
                await _userController.updateUser(
                  User(
                    id: _userController.user!.id,
                    phone: _phoneController.text,
                    email: _emailController.text,
                    instaId: _instaIdController.text,
                    nickName: _nickNameController.text,
                    portfolio: _portfolioController.text,
                    workLink: _workLinkController.text,
                  ),
                );
                SharedLoader.hideLoader();
              },
            ),
          ],
        ),
      ),
    );
  }
}
