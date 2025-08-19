import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/campaign/campaign_controller.dart'
    show CampaignController;
import 'package:getxdemo/models/campaign.dart' show Status;
import 'package:getxdemo/shared_widgets/appbar/shared_app_bar.dart';
import 'package:getxdemo/shared_widgets/text_fields/shared_text_field.dart';

class CampaignScreen extends StatefulWidget {
  const CampaignScreen({super.key});

  @override
  State<CampaignScreen> createState() => _CampaignScreenState();
}

class _CampaignScreenState extends State<CampaignScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final CampaignController _campaignController = Get.find<CampaignController>();
  final _searchNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: Status.values.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      final selectedStatus = Status.values[_tabController.index];
      _campaignController.applyFilter(selectedStatus);
    });
    _campaignController.getCampaign().then((value) => _campaignController.applyFilter(Status.values[_tabController.index]),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SharedAppBar.getAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => _searchNode.unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "Campaign Matching",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SharedTextField.getFields(
                  controller: null,
                  focusNode: _searchNode,
                  onChanged: (p0) {
                    debugPrint(p0);
                    _campaignController.searchString.value = p0;
                    _campaignController.applyFilter(Status.values[_tabController.index]);
                  },
                  hint: "Search title",
                  readOnly: false,
                  inputAction: TextInputAction.none,
                  inputType: TextInputType.text,
                ),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  indicatorColor: Color.fromARGB(
                    255,
                    129,
                    48,
                    239,
                  ),
                  tabs: List.generate(
                    Status.values.length,
                    (index) => Tab(text: Status.values[index].name.toLowerCase()),
                  ),
                ),
                Flexible(
                  child: Obx(() {
                    debugPrint("${_campaignController.filteredList.length}:::::::::::::::::::::::::::");
                    return (_campaignController.campaignLoaded.value)
                        ? ListView.builder(
                          itemCount: _campaignController.filteredList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                _campaignController
                                    .filteredList[index]
                                    .posterPath,
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    _campaignController
                                        .filteredList[index]
                                        .subTitle,
                                  ),
                                  const SizedBox(height: 4),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children:
                                        _campaignController
                                            .filteredList[index]
                                            .tags
                                            .map((e) {
                                              return Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                    255,
                                                    248,
                                                    243,
                                                    254,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  e,
                                                  style: TextStyle(
                                                    color: Color.fromARGB(
                                                      255,
                                                      129,
                                                      48,
                                                      239,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            })
                                            .toList(),
                                  ),
                                ],
                              ),
                              title: Text(
                                _campaignController.filteredList[index].title,
                              ),
                              onTap: () async {
                                Get.toNamed("view_campaign",arguments:_campaignController.filteredList[index])?.then((value) => _campaignController.applyFilter(Status.values[_tabController.index]),);
                              },
                            );
                          },
                        )
                        : Center(child: CircularProgressIndicator());
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _campaignController.campaignList.clear();
    _campaignController.filteredList.clear();
    _campaignController.searchString.value = "";
  }
}
