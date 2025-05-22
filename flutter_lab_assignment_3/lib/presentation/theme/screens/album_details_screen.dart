import 'package:flutter/material.dart' show AppBar, BuildContext, Center, CircularProgressIndicator, GridView, Scaffold, SliverGridDelegateWithFixedCrossAxisCount, StatelessWidget, Text, Widget;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lab_assignment_3/logic/blocs/album_state.dart';
import '../../../logic/blocs/album_bloc.dart';
import "../widgets/photo_grid_item.dart";

class AlbumDetailsScreen extends StatelessWidget {
  final int albumId;

  const AlbumDetailsScreen({super.key, required this.albumId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album Details'),
      ),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AlbumDetailLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                final photo = state.photos[index];
                return PhotoGridItem(photo: photo);
              },
            );
          } else if (state is AlbumDetailError) {
            return Center(
              child: Text('Error: ${state.message}'),
            );
          } else {
            return const Center(
              child: Text('Press the button to load album details.'),
            );
          }
        },
      ),
    );
  }
}