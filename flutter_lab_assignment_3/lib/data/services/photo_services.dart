import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/photo_model.dart';

part 'photo_services.g.dart';

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/photos")

abstract class PhotoServices {
  factory PhotoServices(Dio dio, {String baseUrl}) = _PhotoServices;

  @GET("/photos")
  Future<List<PhotoModel>> getPhotosByAlbumId(@Query("albumId") int albumId);
}