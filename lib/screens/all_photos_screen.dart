import 'package:flutter/material.dart';
import 'package:photo_surfing/widgets/widgets.dart';

class AllPhotoScreen extends StatelessWidget {
  const AllPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchBar(),
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 3,
                children: List.generate(10, (index) {
                  return Center(
                    child: Image.asset("assets/img1.png"),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
