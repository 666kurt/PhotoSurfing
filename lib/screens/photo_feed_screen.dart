import 'package:flutter/material.dart';
import '../screens/screens.dart';

class PhotoFeedScreen extends StatelessWidget {
  const PhotoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photo Feed'),
          bottom: TabBar(
            indicatorColor: Color.fromRGBO(0, 98, 255, 1),
            labelColor: Color.fromRGBO(7, 7, 12, 1),
            unselectedLabelColor: Color.fromRGBO(154, 154, 175, 1),
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: 16),
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            dividerColor: Colors.transparent,
            labelStyle: TextStyle(fontSize: 14),
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("All photos"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Favorites authors"),
              ),
            ],
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              AllPhotoScreen(),
              FavoritesAuthorsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
