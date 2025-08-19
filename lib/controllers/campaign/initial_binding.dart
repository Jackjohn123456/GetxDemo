import 'package:get/get.dart';
import 'package:getxdemo/controllers/campaign/campaign_controller.dart';
import 'package:getxdemo/controllers/campaign/user_controller.dart';
import 'package:getxdemo/db/api_client/api_client.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    final ApiClient apiClient = ApiClient(apiClient: http.Client());
    // TODO: implement dependencies
    Get.put(CampaignController(apiClient: apiClient));
    Get.put(UserController(apiClient: apiClient));
  }

}