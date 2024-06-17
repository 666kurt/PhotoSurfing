import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:photo_surfing/widgets/widgets.dart';

class PhotoFeedScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  PhotoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photo Feed'),
          bottom: PhotoFeedTabBar(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                PhotoFeedSearchBar(controller: controller),
                Expanded(
                  child: TabBarView(
                    children: [
                      AllPhotoGrid(),
                      FavoritesAuthorsGrid(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
