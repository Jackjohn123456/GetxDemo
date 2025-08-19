import 'package:get/get.dart';
import 'package:getxdemo/views/campaign/campaign_screen.dart' show CampaignScreen;
import 'package:getxdemo/views/campaign/campaign_view.dart' show CampaignView;
import 'package:getxdemo/views/dashboard/dashboard_screen.dart' show DashboardScreen;
import 'package:getxdemo/views/personl_info/basic_info.dart' show BasicInfo;
import 'package:getxdemo/views/personl_info/credentials.dart' show Credentials;
import 'package:getxdemo/views/personl_info/personal_info_screen.dart' show PersonalInfoScreen;
import 'package:getxdemo/views/splash/splash_screen.dart' show SplashScreen;

class RouteConfig {
  static final routes = [
    GetPage(name: "/", page: ()=>SplashScreen()),
    GetPage(name: "/home", page: () => DashboardScreen(),),
    GetPage(name: "/campaigns", page: () => CampaignScreen(),),
    GetPage(name: "/personalInfo", page: () => PersonalInfoScreen(),),
    GetPage(name: "/basicInfo", page: () => BasicInfo(),),
    GetPage(name: "/credentials", page: () => Credentials(),),
    GetPage(name: "/view_campaign", page: () => CampaignView(campaign:Get.arguments),),
  ];
}