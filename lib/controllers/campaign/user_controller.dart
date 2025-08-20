import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:getxdemo/db/api_client/api_client.dart';
import 'package:getxdemo/models/user.dart';

class UserController extends GetxController{

  var isUserFetchSuccessful = false.obs;
  final ApiClient apiClient;
  User? user;

  UserController({required this.apiClient});

  @override
  void onInit() {
    super.onInit();
    getUser(); // this runs as soon as the controller is created
  }

  Future<void> getUser() async {
    user = await apiClient.getUser();
    debugPrint("User:::::::::::::::::::::::${user?.nickName}");
  }

  Future<void> updateUser(User user) async {
    debugPrint("User:::::::::::::::::::::::${user.nickName}");
    await apiClient.updateUser(user);
    await getUser();
  }

}