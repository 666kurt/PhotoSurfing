import 'package:flutter/material.dart';

class AllPhotoGrid extends StatelessWidget {
  const AllPhotoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      crossAxisCount: 3,
      children: List.generate(200, (index) {
        return Container(
          child: Image.network(
            "https://pics.filmaffinity.com/Cars-746710621-large.jpg",
            fit: BoxFit.fill,
          ),
        );
      }),
    );
  }
}
