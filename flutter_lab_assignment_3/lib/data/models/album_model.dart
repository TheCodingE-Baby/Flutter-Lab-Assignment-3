import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable()

class AlbumModel {
  final int id;
  final String title;
  final String coverUrl; // Add this field

  AlbumModel({
    required this.id,
    required this.title,
    required this.coverUrl, // Add this parameter
  });
  
  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}