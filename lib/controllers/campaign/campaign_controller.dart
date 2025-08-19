import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:getxdemo/db/api_client/api_client.dart';
import 'package:getxdemo/models/campaign.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CampaignController extends GetxController {
  var campaignList = <Campaign>[].obs;
  var filteredList = <Campaign>[].obs;
  var searchString = ''.obs;
  final ApiClient apiClient;
  var campaignLoaded = false.obs;

  CampaignController({required this.apiClient});

  void applyFilter(Status? activeTab){
    debugPrint("::::::::::::::::::Called");
    debugPrint("::::::::::::::::::${campaignList.length}");
    filteredList.value = campaignList.where((campaign) {
      // status filter (skip if null)
      final matchesStatus = activeTab == null || campaign.status == activeTab;

      // search filter (skip if empty)
      final query = searchString.value.toLowerCase();
      final matchesQuery = query.isEmpty ||
          campaign.title.toLowerCase().contains(query) ||
          campaign.subTitle.toLowerCase().contains(query) ||
          campaign.tags.any((tag) => tag.toLowerCase().contains(query));

      return matchesStatus && matchesQuery;
    }).toList();
  }

  Future<void> getCampaign() async {
    try{
      campaignLoaded.value = false;
      campaignList.value =  await apiClient.getCampaigns();
      campaignLoaded.value = true;
    }
    catch(e){
      campaignLoaded.value = true;
      Get.snackbar("Error in Fetching campaign",e.toString());
    }
  }

  updateCampaign(Campaign campaign) async {
    await apiClient.updateCampaign(campaign);
  }
}