import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/controllers/campaign/campaign_controller.dart';
import 'package:getxdemo/models/campaign.dart';
import 'package:getxdemo/shared_widgets/appbar/shared_app_bar.dart';
import 'package:getxdemo/shared_widgets/buttons/shared_buttons.dart' show SharedButtons;
import 'package:getxdemo/shared_widgets/loader/shared_loader.dart';

class CampaignView extends StatelessWidget {
  final Campaign campaign;
  CampaignView({super.key, required this.campaign});
  Status? _activeStatus;
  final _campaignController = Get.find<CampaignController>();

  @override
  Widget build(BuildContext context) {
    _activeStatus = campaign.status;
    return Scaffold(
      appBar: SharedAppBar.getAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _getHeader(),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 252),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 1,
                      style: BorderStyle.solid,
                      color: Color.fromARGB(255, 242, 242, 242),
                    ),
                  ),
                  child: Text(campaign.subTitle),
                ),
                SizedBox(height: 20),
                Text(
                  "Tags",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      campaign.tags.map((e) {
                        return Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 243, 254),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            e,
                            style: TextStyle(
                              color: Color.fromARGB(255, 129, 48, 239),
                            ),
                          ),
                        );
                      }).toList(),
                ),
                SizedBox(height: 20),
                Text(
                  "Status",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 248, 243, 254),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<Status>(
                        value: _activeStatus,
                        underline: SizedBox(), // removes default underline
                        isExpanded: true, // optional: expands to fill container
                        dropdownColor: Color.fromARGB(
                          255,
                          248,
                          243,
                          254,
                        ), // matches container
                        iconEnabledColor: Color.fromARGB(
                          255,
                          129,
                          48,
                          239,
                        ), // custom icon color
                        style: TextStyle(
                          color: Color.fromARGB(255, 129, 48, 239),
                          fontWeight: FontWeight.bold,
                        ),
                        items: Status.values.map((e) {
                              return DropdownMenuItem<Status>(
                                value: e,
                                child: Text(e.name.toUpperCase(),style: TextStyle( fontWeight:e == _activeStatus ? FontWeight.bold : FontWeight.normal),),
                              );
                            }).toList(),
                        onChanged: (Status? value) {
                          if (value != null) {
                            setState(() {
                              _activeStatus = value;
                            });
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: SharedButtons.saveButton(onPressed: () async {
          campaign.status = _activeStatus??campaign.status;
          SharedLoader.showLoader();
          await _campaignController.updateCampaign(campaign);
          SharedLoader.hideLoader();
          Get.back();
        },),
      )
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 25),
              children: [
                TextSpan(
                  text: "Campaign",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: "\n${campaign.title}",
                  style: TextStyle(
                    color: Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(campaign.posterPath),
          ),
        ),
      ],
    );
  }
}
