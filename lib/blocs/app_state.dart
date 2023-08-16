import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../model/album_model.dart';

@immutable // immuatble means that after creating class we not able to change properties of this classes
abstract class AlbumState extends Equatable {}

//data loading state
class AlbumLoadingState extends AlbumState {
  @override
  List<Object?> get props => [];
}

//data loaded state
class AlbumLoadedState extends AlbumState {
  AlbumLoadedState(this.albums);
  final List<AlbumModel> albums;

  @override
  List<Object?> get props => [albums];
}

//data error loading state
class AlbumErrorState extends AlbumState {
  AlbumErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
