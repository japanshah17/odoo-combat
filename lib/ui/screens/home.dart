import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/ui/pages/appeal_view.dart';
import 'package:hackathon/ui/pages/dashboard.dart';
import 'package:hackathon/ui/pages/file_complain_view.dart';
import 'package:hackathon/ui/pages/view_status.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  PageController pageController = PageController(initialPage: 0);
  int navindex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navindex == 0
          ? const Dashboard()
          : navindex == 1
              ? const FileComplain()
              : navindex == 2
                  ? const ViewStatus()
                  : const Appeal(),
      bottomNavigationBar: CurvedNavigationBar(
        index: navindex,
        onTap: (value) {
          setState(() {
            navindex = value;
          });
        },
        backgroundColor: Colors.white,
        color: Colors.black,
        items: const [
          Icon(
            CupertinoIcons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.view_list,
            color: Colors.white,
          ),
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          Icon(
            Icons.view_agenda,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
