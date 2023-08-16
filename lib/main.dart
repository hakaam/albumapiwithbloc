import 'package:albumapiwithbloc/repos/repositries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:albumapiwithbloc/blocs/app_blocs.dart';
import 'package:albumapiwithbloc/blocs/app_events.dart';
import 'package:albumapiwithbloc/blocs/app_state.dart';

import 'package:albumapiwithbloc/model/album_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RepositoryProvider(
        create: (context) => AlbumRepository(),
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AlbumBloc(
        RepositoryProvider.of<AlbumRepository>(context),
      )..add(LoadAlbumEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Albums Api Bloc'),
          centerTitle: true,
        ),
        body: BlocBuilder<AlbumBloc, AlbumState>(
          builder: (context, state) {
            if (state is AlbumLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AlbumLoadedState) {
              List<AlbumModel> albumList = state.albums;
              return ListView.builder(
                itemCount: albumList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    color: Colors.amber,
                    child: Container(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            albumList[index].userId.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            albumList[index].id.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            albumList[index].title!,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is AlbumErrorState) {
              return Center(
                child: Text('Error: ${state.error}'),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
