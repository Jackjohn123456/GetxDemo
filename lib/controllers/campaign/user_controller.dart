import 'package:get/get.dart';
import 'package:getxdemo/db/api_client/api_client.dart';
import 'package:getxdemo/models/user.dart';

class UserController extends GetxController{

  var isUserFetchSuccessful = false.obs;
  final ApiClient apiClient;
  User? user;

  UserController({required this.apiClient});

  Future<void> getUser() async {
    user = await apiClient.getUser();
  }

  Future<void> updateUser(User user) async {
    await apiClient.updateUser(user);
  }

}