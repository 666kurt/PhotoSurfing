import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, bottom: 16),
      child: SearchBar(
        hintText: "Search",
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            color: Color.fromRGBO(154, 154, 175, 1),
          ),
        ),
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromRGBO(226, 226, 234, 1),
        ),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 15),
        ),
        controller: _controller,
        leading: Icon(
          Icons.search,
          color: Color.fromRGBO(154, 154, 175, 1),
        ),
      ),
    );
  }
}
