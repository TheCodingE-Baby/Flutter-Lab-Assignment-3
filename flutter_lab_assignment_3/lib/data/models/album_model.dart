import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()

class AlbumModel {
  final int id;
  final int userId;
  final String title;
  final String coverUrl;

  AlbumModel({
    required this.id,
    required this.title,
    required this.userId,
    required this.coverUrl,
  });
  
  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}