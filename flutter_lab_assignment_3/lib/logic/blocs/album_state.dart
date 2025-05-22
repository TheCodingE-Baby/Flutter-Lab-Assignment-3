import 'package:equatable/equatable.dart';
import '../../../data/models/album_model.dart';
import '../../../data/models/photo_model.dart';


abstract class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

class AlbumInitial extends AlbumState {
  const AlbumInitial();

  @override
  List<Object> get props => [];
}
class AlbumLoading extends AlbumState {}
class AlbumLoaded extends AlbumState {
  final List<AlbumModel> albums;

  const AlbumLoaded(this.albums);

  @override
  List<Object> get props => [albums];
}
class AlbumError extends AlbumState {
  final String message;

  const AlbumError({required this.message});

  @override
  List<Object> get props => [message];
}

class AlbumDetailState extends AlbumState{}
class AlbumDetailLoading extends AlbumDetailState{}
class AlbumDetailLoaded extends AlbumDetailState{
  final List<PhotoModel> photos;

 AlbumDetailLoaded(this.photos);

  @override
  List<Object> get props => [photos];
}

class AlbumDetailError extends AlbumDetailState{
  final String message;

 AlbumDetailError({required this.message});

  @override
  List<Object> get props => [message];
}