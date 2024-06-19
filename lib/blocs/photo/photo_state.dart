import '../../models/models.dart';

abstract class PhotoState {
  const PhotoState();
}

class PhotoInitialState extends PhotoState {}

class PhotoLoadingState extends PhotoState {}

class PhotoLoadedState extends PhotoState {
  final List<Photo> photos;

  const PhotoLoadedState(this.photos);
}

class PhotoErrorState extends PhotoState {
  final String message;

  const PhotoErrorState(this.message);
}
