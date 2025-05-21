import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../logic/blocs/album_bloc.dart' show AlbumBloc, AlbumError, AlbumLoaded, AlbumLoading, AlbumState, LoadAlbums;

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Albums'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumLoaded) {
            return ListView.builder(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to album detail screen
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(album.title),
                      // Add more UI elements to display album details
                    ),
                  ),
                );
              },
            );
          } else if (state is AlbumError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );

          } else {
            return Center(
              child: Text('Press the button to load albums.'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<AlbumBloc>(context).add(LoadAlbums());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}