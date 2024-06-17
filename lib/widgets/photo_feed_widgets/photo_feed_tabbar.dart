import 'package:flutter/material.dart';

class PhotoFeedTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PhotoFeedTabBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(30);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Color.fromRGBO(0, 98, 255, 1),
      labelColor: Color.fromRGBO(7, 7, 12, 1),
      unselectedLabelColor: Color.fromRGBO(154, 154, 175, 1),
      labelStyle: TextStyle(fontSize: 16),
      labelPadding: EdgeInsets.only(bottom: 4),
      dividerColor: Colors.transparent,
      indicatorWeight: 3,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
      overlayColor: MaterialStatePropertyAll(Colors.transparent),
      tabs: [
        Text("All photos"),
        Text("Favorites authors"),
      ],
    );
  }
}
