import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_surfing/repositories/repositories.dart';
import 'photo_state.dart';
import 'photo_event.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository _photoRepository = PhotoRepository();

  PhotoBloc() : super(PhotoInitialState()) {
    on<FetchPhotoEvent>((event, emit) async {
      try {
        emit(PhotoLoadingState());
        final photos = await _photoRepository.fetchPhoto();
        emit(PhotoLoadedState(photos));
      } catch (e) {
        emit(PhotoErrorState(e.toString()));
      }
    });
  }
}
