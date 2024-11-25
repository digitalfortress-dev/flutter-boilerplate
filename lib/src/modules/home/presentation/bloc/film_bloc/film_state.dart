part of 'film_bloc.dart';

enum FilmStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
}

class FilmState extends Equatable {
  final List<FilmEntity> films;
  final FilmStateStatus status;
  final Exception? error;

  @override
  List<Object> get props => [films];
  const FilmState._({
    this.status = FilmStateStatus.initial,
    this.films = const [],
    this.error,
  });

  FilmState copyWith({
    FilmStateStatus? status,
    List<FilmEntity>? films,
    Exception? error,
  }) {
    return FilmState._(
      status: status ?? this.status,
      films: films ?? this.films,
      error: error ?? this.error,
    );
  }

  const FilmState.initial() : this._();

  FilmState asLoading() {
    return copyWith(
      status: FilmStateStatus.loading,
    );
  }

  FilmState asLoadSuccess(List<FilmEntity> films) {
    return copyWith(
      status: FilmStateStatus.loadSuccess,
      films: films,
    );
  }

  FilmState asLoadFailure(Exception e) {
    return copyWith(
      status: FilmStateStatus.loadFailure,
      error: e,
    );
  }
}
