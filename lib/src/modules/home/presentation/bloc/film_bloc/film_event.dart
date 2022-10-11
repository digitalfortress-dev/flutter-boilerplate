part of 'film_bloc.dart';

abstract class FilmEvent extends Equatable {
  const FilmEvent();

  @override
  List<Object> get props => [];
}

class FetchFilmsEvent extends FilmEvent {}
