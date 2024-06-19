import 'package:flutter/material.dart';
import '../models/models.dart';

class DetailPhotoScreen extends StatelessWidget {
  const DetailPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as Photo;
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
      ),
      body: Center(
        child: Image.network(photo.profileImage),
      ),
    );
  }
}
