import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/src/core/providers/local/app_storage.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(localeCodeProvider: 'en')) {
    on<UpdateLocaleCodeEvent>((event, emit) async {
      emit(state.copyWith(localeCodeProvider: event.localeCode));
      await AppStorage.use().prefHelper.setLanguageCode(event.localeCode);
    });
  }
}
