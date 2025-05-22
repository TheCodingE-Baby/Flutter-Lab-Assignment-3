import 'package:flutter/material.dart' show Brightness, BuildContext, ColorScheme, Colors, MaterialApp, StatelessWidget, ThemeData, Widget, runApp;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'routes/app_router.dart';
import 'data/repos/album_repository.dart';
import 'data/repos/photo_repository.dart';
import '../logic/blocs/album_bloc.dart';
import '../logic/blocs/photo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final albumRepository = AlbumRepository(dio: dio);
    final photoRepository = PhotoRepository(dio: dio);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AlbumBloc(albumRepository: albumRepository),
        ),
        BlocProvider(
          create: (_) => PhotoBloc(photoRepository: photoRepository),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Album App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueAccent,
            brightness: Brightness.dark,
          ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}