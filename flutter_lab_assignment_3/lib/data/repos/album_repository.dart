import 'package:dio/dio.dart';
import '../services/album_services.dart';
import '../models/album_model.dart';

abstract class IAlbumRepository {
  Future<List<AlbumModel>> fetchAlbums();
}

class AlbumRepository implements IAlbumRepository {
  final AlbumServices albumServices;

  AlbumRepository({required Dio dio})
      : albumServices = AlbumServices(dio);

  @override
  @override
  Future<List<AlbumModel>> fetchAlbums() async {
    try {
      final albums = await albumServices.getAlbums();
      return albums;
    } catch (e) {
      throw Exception('Failed to load albums: $e');
    }
  }
}