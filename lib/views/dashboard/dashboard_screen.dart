import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxdemo/shared_widgets/tiles/shared_tiles.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _getHeader(),
                SizedBox(height: 20),
                _getCampaign(),
                SizedBox(height: 20),
                SharedTiles.getTiles(
                  title: "My Information",
                  imagePath: "assets/icons/user.png",
                  onTap: () {
                    Get.toNamed("personalInfo");
                  },
                ),
                SharedTiles.getTiles(
                  title: "Announcement",
                  imagePath: "assets/icons/note-2.png",
                ),
                SharedTiles.getTiles(
                  title: "1:1 Inquiry",
                  imagePath: "assets/icons/messages.png",
                ),
                SharedTiles.getTiles(
                  title: "FAQ",
                  imagePath: "assets/icons/message-question.png",
                ),
               SharedTiles. getTiles(
                  title: "T&C",
                  imagePath: "assets/icons/task-square.png",
                ),
               SharedTiles. getTiles(
                  title: "Logout",
                  imagePath: "assets/icons/Group.png",
                ),
                SharedTiles.getTiles(
                  title: "Withdraw Membership",
                  imagePath: "assets/icons/break away.png",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 25),
            children: [
              TextSpan(text: "Hello", style: TextStyle(color: Colors.grey)),
              TextSpan(
                text: "\nHong Gil-dong",
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundImage: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s',
          ),
        ),
      ],
    );
  }

  List<Widget> _getCategoryCountSection({
    required String title,
    required int count,
    bool showIcon = true,
  }) {
    return [
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 18),
          children: [
            TextSpan(
              text: "$count\n",
              style: TextStyle(
                color: Color.fromARGB(255, 68, 13, 126),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(text: title, style: TextStyle(color: Colors.black)),
          ],
        ),
      ),
      Visibility(
        visible: showIcon,
        child: Icon(
          color: Color.fromARGB(255, 188, 188, 188),
          size: 18,
          Icons.arrow_forward_ios_rounded,
        ),
      ),
    ];
  }

  Widget _getCampaign() {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("My Campaign", style: TextStyle(fontSize: 18)),
              IconButton(
                onPressed: () {
                  Get.toNamed("campaigns");
                },
                icon: Icon(size: 20, Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // RichText(
              //   text: TextSpan(
              //       style: TextStyle(fontSize: 20),
              //       children: [
              //         TextSpan(text: "  0\n",style: TextStyle(color: Color.fromARGB(255, 68, 13, 126),fontWeight:FontWeight.w600)),
              //         TextSpan(text: "App",style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600)),
              //       ]
              //   ),),
              // Visibility(visible: true,child: Icon(color: Color.fromARGB(255, 188, 188, 188),Icons.arrow_forward_ios_rounded)),
              // RichText(
              //   text: TextSpan(
              //       style: TextStyle(fontSize: 20),
              //       children: [
              //         TextSpan(text: "  0\n",style: TextStyle(color: Color.fromARGB(255, 68, 13, 126),fontWeight:FontWeight.w600)),
              //         TextSpan(text: "WIP",style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600)),
              //       ]
              //   ),),
              // Visibility(visible: true,child: Icon(color: Color.fromARGB(255, 188, 188, 188),Icons.arrow_forward_ios_rounded)),
              // RichText(
              //   text: TextSpan(
              //       style: TextStyle(fontSize: 20),
              //       children: [
              //         TextSpan(text: "  0\n",style: TextStyle(color: Color.fromARGB(255, 68, 13, 126),fontWeight:FontWeight.w600)),
              //         TextSpan(text: "Complete",style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600)),
              //       ]
              //   ),),
              // Visibility(visible: false,child: Icon(color: Color.fromARGB(255, 188, 188, 188),Icons.arrow_forward_ios_rounded)),
              ..._getCategoryCountSection(title: "Application", count: 0),
              ..._getCategoryCountSection(title: "Pending", count: 0),
              ..._getCategoryCountSection(
                title: "Complete",
                count: 0,
                showIcon: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
