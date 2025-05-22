import 'package:dio/dio.dart';
import '../services/album_services.dart';
import '../models/album_model.dart';
import '../models/photo_model.dart';

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AlbumServiceGenerator
// **************************************************************************

class _AlbumServices implements AlbumServices {
  final Dio _dio;
  final String baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  _AlbumServices(this._dio) {
    _dio.options.baseUrl = baseUrl;
  }

  @override
  Future<List<AlbumModel>> getAlbums() async {
    try {
      final response = await _dio.get('/albums');
      return (response.data as List)
          .map((album) => AlbumModel.fromJson(album))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<AlbumModel> getAlbumById(int id) async {
    try {
      final response = await _dio.get('/albums/$id');
      return AlbumModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<AlbumModel> createAlbum(AlbumModel album) async {
    try {
      final response = await _dio.post('/albums', data: album.toJson());
      return AlbumModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAlbum(int id) async {
    try {
      await _dio.delete('/albums/$id');
    } catch (e) {
      rethrow;
    }
  }

  Future<AlbumModel> updateAlbum(int id, AlbumModel album) async {
    try {
      final response = await _dio.put('/albums/$id', data: album.toJson());
      return AlbumModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<PhotoModel>> getPhotosByAlbumId(int albumId) async {
    try {
      final response = await _dio.get('/albums/$albumId/photos');
      return (response.data as List)
          .map((photo) => PhotoModel.fromJson(photo))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}