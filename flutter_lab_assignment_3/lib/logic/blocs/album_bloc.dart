import 'package:bloc/bloc.dart' show Bloc;
import '../../data/repos/album_repository.dart';
import '../blocs/album_event.dart';
import '../blocs/album_state.dart';


class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final IAlbumRepository albumRepository;

  AlbumBloc({required this.albumRepository}) : super(AlbumInitial()) {
    on<LoadAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await albumRepository.fetchAlbums();
        emit(AlbumLoaded(albums));
      } catch (e) {
        emit(AlbumError(message: e.toString()));
      }
    });
  }
}