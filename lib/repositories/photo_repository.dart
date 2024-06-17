import 'package:dio/dio.dart';
import '../models/models.dart';

class PhotoRepository {
  final Dio dio;
  final String apiUrl;

  PhotoRepository({required this.dio, required this.apiUrl});

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
