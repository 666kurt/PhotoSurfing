import 'package:flutter/material.dart';

class PhotoFeedScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  PhotoFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Feed'),
      ),
    );
  }
}
