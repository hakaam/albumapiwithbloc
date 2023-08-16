import 'package:albumapiwithbloc/blocs/app_events.dart';
import 'package:albumapiwithbloc/blocs/app_state.dart';
import 'package:albumapiwithbloc/repos/repositries.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumRepository _albumRepositry;

  AlbumBloc(this._albumRepositry) : super(AlbumLoadingState()) {
    on<LoadAlbumEvent>((event, emit) async {
      emit(AlbumLoadingState());

      try {
        final users = await _albumRepositry.getAlbums();

        emit(AlbumLoadedState(users));
      } catch (e) {
        emit(AlbumErrorState(e.toString()));

      }
    });
  }
}
