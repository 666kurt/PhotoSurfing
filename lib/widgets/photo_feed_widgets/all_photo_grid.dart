import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_surfing/blocs/photo/photo_bloc.dart';
import 'package:photo_surfing/blocs/photo/photo_state.dart';

import '../../models/models.dart';

class AllPhotoGrid extends StatelessWidget {
  const AllPhotoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        if (state is PhotoLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is PhotoLoadedState) {
          return MasonryGridView.builder(
            itemCount: state.photos.length,
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final photo = state.photos[index];
              return Padding(
                padding: EdgeInsets.all(4),
                child: GestureDetector(
                  onTap: () => photoTapped(context, photo),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(photo.url),
                  ),
                ),
              );
            },
          );
        } else if (state is PhotoErrorState) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('Unknown error'));
        }
      },
    );
  }

  void photoTapped(BuildContext context, Photo photo) {
    Navigator.of(context).pushNamed('/detail_photo_screen', arguments: photo);
  }
}
