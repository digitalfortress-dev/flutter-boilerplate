part of 'language_bloc.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class UpdateLocaleCodeEvent extends LanguageEvent {
  const UpdateLocaleCodeEvent({required this.localeCode});
  final String localeCode;
}
