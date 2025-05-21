import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';

// ignore: depend_on_referenced_packages
import 'package:retrofit/http.dart';

part "album_services.g.dart";

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/albums")
abstract class AlbumServices {
  factory AlbumServices(Dio dio, {String? baseUrl}) = _AlbumServices;

  // Add this method to match the repository usage
  @GET("/albums")
  Future<List<AlbumModel>> getAlbums();

  @GET("/albums/{albumId}/photos")
  Future<List<PhotoModel>> getPhotosByAlbumId(@Path("albumId") int albumId);
}