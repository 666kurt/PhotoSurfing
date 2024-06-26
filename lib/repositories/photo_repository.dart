import 'package:dio/dio.dart';
import '../models/models.dart';

final class PhotoRepository {
  final Dio dio = Dio();
  final String apiUrl =
      "https://api.unsplash.com/photos/?client_id=swKGHFpF-pFLnTUjXHUt55iWIkniEF7qUbPlEDclRns";

  Future<List<Photo>> fetchPhoto() async {
    try {
      final responce = await dio.get(apiUrl);

      if (responce.statusCode == 200) {
        List<dynamic> data = responce.data;
        return data.map((item) => Photo.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load photos');
      }
    } catch (e) {
      throw Exception('Failed to load photos: ${e}');
    }
  }
}
