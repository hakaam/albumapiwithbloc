import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


@immutable // immuatble means that after creating class we not able to change properties of this classes

abstract class AlbumEvent extends Equatable{
   const AlbumEvent();

}
//data loading state
class LoadAlbumEvent extends AlbumEvent{
  @override
  List<Object?> get props => [];



}

