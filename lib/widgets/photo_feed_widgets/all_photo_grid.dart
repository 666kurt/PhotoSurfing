import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_surfing/blocs/photo/photo_bloc.dart';
import 'package:photo_surfing/blocs/photo/photo_event.dart';
import 'package:photo_surfing/blocs/photo/photo_state.dart';
import 'package:photo_surfing/repositories/repositories.dart';

class AllPhotoGrid extends StatelessWidget {
  const AllPhotoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PhotoBloc(
        PhotoRepository(
          dio: Dio(),
          apiUrl:
              "https://api.unsplash.com/photos/?client_id=swKGHFpF-pFLnTUjXHUt55iWIkniEF7qUbPlEDclRns",
        ),
      )..add(FetchPhotoEvent()),
      child: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoLoadedState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PhotoLoadedState) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return Image.network(photo.rawUrl);
              },
            );
          } else if (state is PhotoErrorState) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('Unknown error'));
          }
        },
      ),
    );
  }
}
