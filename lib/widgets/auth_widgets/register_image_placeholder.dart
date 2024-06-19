import 'dart:io';
import 'package:flutter/material.dart';

class RegisterImagePlaceholder extends StatelessWidget {
  final File? avatarImage;
  final File? headerImage;

  const RegisterImagePlaceholder({
    super.key,
    required this.avatarImage,
    required this.headerImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              color: Color.fromRGBO(198, 203, 217, 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: headerImage == null
                  ? Container()
                  : Image.file(
                      headerImage!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Transform.translate(
            offset: Offset(0, 40),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(144, 147, 157, 1),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: avatarImage == null
                    ? Icon(
                        Icons.person,
                        size: 40,
                        color: Color.fromRGBO(226, 226, 234, 1),
                      )
                    : Image.file(
                        avatarImage!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
