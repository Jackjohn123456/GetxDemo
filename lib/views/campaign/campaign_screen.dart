import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/models/campaign.dart' show Status;
import 'package:getxdemo/shared_widgets/appbar/shared_app_bar.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen> with SingleTickerProviderStateMixin{
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: Status.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar.getAppBar(),
      body: SafeArea(
          child: Column(
            children: [
              Text("TITLE"),
              TabBar(
                controller:_tabController,
                  tabs:List.generate(Status.values.length, (index) => Tab(text: Status.values[index].name.toUpperCase(),),)
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: 25,
                    scrollDirection: Axis.vertical,
                    itemBuilder:(context, index) {
                      return ListTile(
                      title: Text("Test"),
                      );
                    },
                ),
              )
            ],
          )
      ),
    );
  }
}
