import 'dart:convert';

import 'package:flutter/foundation.dart' show debugPrint;
import 'package:get/get.dart';
import 'package:getxdemo/db/api_client/url_config.dart';
import 'package:getxdemo/models/campaign.dart';
import 'package:getxdemo/models/user.dart' show User;
import 'package:http/http.dart' as http;

class ApiClient {
  http.Client apiClient;

  ApiClient({required this.apiClient});

  Future<List<Campaign>> getCampaigns() async {
    try{
      final url = Uri.parse(UrlConfig.getCampaignUrl);

      final res = await apiClient.get(url);
      if(res.statusCode==200){
        final listOfJson = jsonDecode(res.body) as List;
        return listOfJson.map((element) => Campaign.fromJson(element)).toList();
      }
      else{
        Get.snackbar('Error', 'Failed to fetch employees');
        return [];
      }
    }
    catch(e){
      Get.snackbar("Error", e.toString());
      return [];
    }
  }

  Future<void> updateCampaign(Campaign campaign) async {
     try{
       debugPrint("Updating Campaign:::::::::::::::::::");
       final url = Uri.parse("${UrlConfig.getCampaignUrl}/${campaign.id}");
       debugPrint(url.path);
       final json = jsonEncode(campaign.toJson());
       final res = await http.put(url,headers:{"Content-Type": "application/json"},body: json);
       if(res.statusCode==200){
         debugPrint(jsonDecode(res.body).toString());
       }
       else{
         debugPrint("status Code : ${res.statusCode}");
       }
     }
     catch(e){
       debugPrint(e.toString());
     }
  }

  Future<User?> getUser() async {
    try{
      final url = Uri.parse(UrlConfig.getUserUrl);
      final res = await apiClient.get(url);
      if(res.statusCode==200){
        final listOfJson = jsonDecode(res.body) as List;
        if(listOfJson.isEmpty) return null;
        return User.fromJson(listOfJson.first);
      }
      else{
        Get.snackbar('Error', 'Failed to fetch employees');
      }
    }
    catch(e){
      Get.snackbar("Error", e.toString());
    }
    return null;
  }

  Future<void> updateUser(User user) async {
    try{
      debugPrint("Updating Campaign:::::::::::::::::::");
      final url = Uri.parse("${UrlConfig.getCampaignUrl}/${user.id}");
      debugPrint(url.path);
      final json = jsonEncode(user.toJson());
      final res = await http.put(url,headers:{"Content-Type": "application/json"},body: json);
      if(res.statusCode==200){
        debugPrint(jsonDecode(res.body).toString());
      }
      else{
        debugPrint("status Code : ${res.statusCode}");
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
  }

}