import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/entities/film_entity.dart';
import 'package:flutter_boilerplate/src/modules/home/domain/usecases/film_usecases.dart';

part 'film_event.dart';
part 'film_state.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  final FetchFilmUseCase _filmUseCase;
  FilmBloc(this._filmUseCase) : super(const FilmState.initial()) {
    on<FetchFilmsEvent>(
      _onLoad,
    );
  }

  void _onLoad(FetchFilmsEvent event, Emitter<FilmState> emit) async {
    emit(state.asLoading());
    try {
      List<FilmEntity> films = await _filmUseCase();
      emit(state.asLoadSuccess(films));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }
}
