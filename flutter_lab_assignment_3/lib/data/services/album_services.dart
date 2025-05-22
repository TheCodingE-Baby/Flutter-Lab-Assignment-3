import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';


@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/albums")
abstract class AlbumServices {
  factory AlbumServices(Dio dio, {String? baseUrl}) = _AlbumServices;

  @GET("/albums")
  Future<List<AlbumModel>> getAlbums();

  @GET("/albums/{albumId}/photos")
  Future<List<PhotoModel>> getPhotosByAlbumId(@Path("albumId") int albumId);
}