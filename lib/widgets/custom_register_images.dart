import 'dart:io';
import 'package:flutter/material.dart';

class CustomRegisterImages extends StatelessWidget {
  File? avatarImage;
  CustomRegisterImages({super.key, required this.avatarImage});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> _avatarImage = Image.file(avatarImage!).image;

    return Padding(
      padding: const EdgeInsets.only(bottom: 58),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 128,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(198, 203, 217, 1),
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: _avatarImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          CircleAvatar(),
        ],
      ),
    );
  }
}
