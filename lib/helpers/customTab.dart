import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money/screens/page2.dart';

import '../screens/page1.dart';
import '../screens/page3.dart';

class CustomTab extends StatefulWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children:  const [
                  TabBar(
                    isScrollable: true,
                    physics: NeverScrollableScrollPhysics(),
                    labelColor: Color(0xff5EB19D),
                    labelStyle: TextStyle(
                      fontFamily: "PushPenny",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontFamily: "PushPenny",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor:  Color(0xff5EB19D),
                    indicatorWeight: 1.5,
                    tabs: [
                      Tab(
                        text: 'About Items',
                      ),
                      Tab(
                        text: "Reviews",
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
