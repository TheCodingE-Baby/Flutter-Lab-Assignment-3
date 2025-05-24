// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) => AlbumModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  userId: (json['userId'] as num).toInt(),
  coverUrl: json['coverUrl'] as String,
);

Map<String, dynamic> _$AlbumModelToJson(AlbumModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'coverUrl': instance.coverUrl,
    };
