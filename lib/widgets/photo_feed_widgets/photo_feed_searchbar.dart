import 'package:flutter/material.dart';

class PhotoFeedSearchBar extends StatelessWidget {
  final TextEditingController controller;
  const PhotoFeedSearchBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: SearchBar(
        controller: controller,
        leading: Icon(Icons.search, color: Color.fromRGBO(154, 154, 175, 1)),
        hintText: 'Search',
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            color: Color.fromRGBO(154, 154, 175, 1),
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(226, 226, 234, 1),
        ),
        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15)),
      ),
    );
  }
}
